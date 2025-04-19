## 🛠️ Custom Middleware Integration

SolidQueue allows you to inject custom logic at both client and server sides via middleware. This is useful for adding headers, tracing, or modifying payloads before enqueuing or executing jobs. Below is how you can register and implement your own middleware for advanced operation interception.

```ruby
# config/initializers/solid_queue.rb
SolidQueue.configure do |config|
  # Add a middleware before jobs are published
  config.client_middleware.use CustomHeaderMiddleware
  # Add a middleware around job execution on the worker
  config.server_middleware.use CustomLoggingMiddleware
end
```

```ruby
# lib/middleware/custom_header_middleware.rb
class CustomHeaderMiddleware
  def call(env, next_middleware)
    env[:headers]['X-Custom-Header'] = 'MyApp/#{Time.now.to_i}'
    next_middleware.call(env)
  end
end
```

```ruby
# lib/middleware/custom_logging_middleware.rb
class CustomLoggingMiddleware
  def call(env, next_middleware)
    start = Time.now
    result = next_middleware.call(env)
    Rails.logger.info("Job \\#{env[:job_id]} executed in \\#{Time.now - start}s")
    result
  end
end
```