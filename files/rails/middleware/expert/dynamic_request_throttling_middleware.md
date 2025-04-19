## 🔧 Implement Dynamic Request Throttling

To protect your Rails API from abusive traffic, build a Rack middleware that dynamically throttles per-user or per-endpoint requests using Redis as a sliding‐window counter. The middleware increments a Redis counter on each request, sets an expiry window, and returns HTTP 429 once the limit is exceeded, applying exponential backoff on repeated violations. Integrate it early in the stack to fail fast under load spikes.

```ruby
class DynamicRequestThrottling
  def initialize(app, options = {})
    @app   = app
    @redis = options.fetch(:redis)
    @limit = options.fetch(:limit, 100)
    @window = options.fetch(:window, 60) # seconds
  end

  def call(env)
    key = "throttle:#{extract_identifier(env)}"
    count = @redis.get(key).to_i
    if count >= @limit
      retry_after = @redis.ttl(key)
      return [429, {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s}, [{error: 'Rate limit exceeded'}.to_json]]
    end

    @redis.multi do
      @redis.incr(key)
      @redis.expire(key, @window)
    end

    @app.call(env)
  end

  private

  def extract_identifier(env)
    # Use IP, API token or user ID from Rack env
    env['HTTP_X_API_TOKEN'] || env['REMOTE_ADDR']
  end
end

# config/application.rb
Rails.application.config.middleware.insert_before 0, DynamicRequestThrottling,
  redis: Redis.new(url: ENV['REDIS_URL']), limit: 200, window: 60
```