## 🔧 Custom Rack Middleware Injection

In API mode applications, you can fine‑tune request handling by injecting your own Rack middleware. This is useful for custom metrics, request correlation (e.g., X‑Request‑ID), or advanced rate‑limiting. Create the middleware under `lib/` and then insert it into the stack in `config/application.rb`.

```ruby
# lib/middleware/request_logger.rb
module Middleware
  class RequestLogger
    def initialize(app)
      @app = app
    end

    def call(env)
      start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      status, headers, response = @app.call(env)
      duration = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000
      Rails.logger.info "[RequestLogger] #{env['REQUEST_METHOD']} #{env['PATH_INFO']} took #{duration.round(2)}ms"
      [status, headers, response]
    end
  end
end

# config/application.rb
module YourApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join('lib/middleware')

    # Insert before ActionDispatch::Executor to capture full request timing
    config.middleware.insert_before ActionDispatch::Executor, Middleware::RequestLogger
  end
end
```