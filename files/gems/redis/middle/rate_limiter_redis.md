## 🚦 Rate Limiting with Redis Sliding Window

Implement a sliding-window rate limiter using sorted sets to track request timestamps. This pattern helps enforce per-user or per-IP limits without external libraries and leverages Redis atomic operations.

```ruby
# app/services/rate_limiter.rb
class RateLimiter
  WINDOW_SIZE = 60  # seconds
  LIMIT = 100       # max requests per window

  def initialize(user_id)
    @user_key = "rate_limit:#{user_id}"
  end

  def allowed?
    now = Time.now.to_i
    result = redis.multi do |r|
      r.zadd @user_key, now, now
      r.zremrangebyscore @user_key, 0, now - WINDOW_SIZE
      r.zcard @user_key
      r.expire @user_key, WINDOW_SIZE
    end
    result.last <= LIMIT
  end

  private

  def redis
    @redis ||= Redis.new(url: ENV['REDIS_URL'])
  end
end
```