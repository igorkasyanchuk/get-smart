## ⏱ Implement API rate limiting with Redis and Lua

Throttle API requests per user or IP by using Redis and an atomic Lua script to increment and expire counters. This approach minimizes race conditions and provides precise rate limiting logic within Redis.

```ruby
# lib/rate_limiter.rb
class RateLimiter
  LUA_SCRIPT = <<~LUA
    local current = redis.call('INCR', KEYS[1])
    if tonumber(current) == 1 then
      redis.call('PEXPIRE', KEYS[1], ARGV[1])
    end
    return current
  LUA

  def initialize(redis: Redis.new(url: ENV['REDIS_URL']), limit: 100, period_ms: 60_000)
    @redis = redis
    @limit = limit
    @period = period_ms
  end

  def allowed?(key)
    count = @redis.eval(LUA_SCRIPT, keys: [key], argv: [@period])
    count.to_i <= @limit
  end
end

# Usage in controller
before_action do
  limiter = RateLimiter.new
  head :too_many_requests unless limiter.allowed?("rate:#{request.ip}")
end
```
