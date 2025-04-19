## 🔍 Log Request Details

Creating a custom middleware allows you to capture and log request metadata before Rails even hits your controllers. This can be invaluable for performance monitoring or security auditing. Place your middleware in `app/middleware` and then hook it into the stack.

```ruby
# app/middleware/request_logger.rb
class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    status, headers, response = @app.call(env)
    duration = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time) * 1000).round(2)
    Rails.logger.info "[RequestLogger] #{env['REQUEST_METHOD']} #{env['PATH_INFO']} completed in #{duration}ms with status #{status}"
    [status, headers, response]
  end
end
```

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Insert after Rails::Rack::Logger so you still see Rails logs
    config.middleware.insert_after Rails::Rack::Logger, RequestLogger
  end
end
```
