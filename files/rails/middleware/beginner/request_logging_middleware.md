## 📋 Logging Requests with Middleware

You can build a simple logger middleware to track request timings and statuses. This is great for debugging performance bottlenecks without touching controllers. It wraps the downstream call, measures duration, and logs useful info.

```ruby
# lib/request_logger.rb
class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    duration = ((Time.now - start_time) * 1000).round(1)
    Rails.logger.info "[RequestLogger] #{env['REQUEST_METHOD']} #{env['PATH_INFO']} -> #{status} (#{duration}ms)"
    [status, headers, response]
  end
end

# config/application.rb
module YourApp
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.middleware.use RequestLogger
  end
end
```