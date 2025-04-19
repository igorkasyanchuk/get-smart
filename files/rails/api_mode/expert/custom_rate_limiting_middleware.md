## 🛡️ Custom Rate Limiting Middleware
Implement a Redis‑backed rate limiter at the Rack layer for per‑API key throttling. By inserting a custom middleware before `ActionDispatch::Executor`, you can enforce fine‑grained request caps and respond with `429 Too Many Requests` when limits are exceeded.

```ruby
# lib/middleware/rate_limiter.rb
class RateLimiter
  LIMIT = 100
  WINDOW = 60 # seconds

  def initialize(app)
    @app = app
    @redis = Redis.new(url: ENV['REDIS_URL'])
  end

  def call(env)
    key = "rate:#{env['HTTP_API_KEY']}:#{Time.now.to_i / WINDOW}"
    count = @redis.incr(key)
    @redis.expire(key, WINDOW) if count == 1

    if count > LIMIT
      return [429, {'Content-Type'=>'application/json'}, [{error: 'Rate limit exceeded'}.to_json]]
    end

    @app.call(env)
  end
end
```

```ruby
# config/application.rb (inside class Application)
config.middleware.insert_before ActionDispatch::Executor, "RateLimiter"
```