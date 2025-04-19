## 🛠️ Custom Logging Middleware
Creating a custom logging middleware lets you capture detailed request and response information without polluting controllers. This approach is useful for auditing, custom metrics, or integrating with external logging services. Implement the `call` method, log before and after the downstream app, and ensure you properly forward the `env` and response.

```ruby
# app/middleware/custom_logging_middleware.rb
class CustomLoggingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    Rails.logger.info("[CustomLogger] Started #{env['REQUEST_METHOD']} #{env['PATH_INFO']}")

    status, headers, response = @app.call(env)

    duration = ((Time.now - start_time) * 1000).round(2)
    Rails.logger.info("[CustomLogger] Completed in #{duration}ms with status #{status}")

    [status, headers, response]
  end
end

# config/application.rb
config.middleware.use CustomLoggingMiddleware
```
