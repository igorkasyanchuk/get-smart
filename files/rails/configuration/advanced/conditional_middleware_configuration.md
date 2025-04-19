## 🔌 Conditional Middleware Configuration Based on Environment or Envvars

Customize your middleware stack dynamically to optimize performance or enable debugging only when needed. By checking `Rails.env` or `ENV` inside `config/application.rb`, you can insert, replace, or remove middleware without manual edits per environment file.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Always use Rack::Attack in production
    if Rails.env.production?
      config.middleware.use Rack::Attack
    end

    # Use a custom logger middleware when DEBUG_MODE is enabled
    if ENV["DEBUG_MODE"] == "true"
      require_relative "../lib/middleware/request_logger"
      config.middleware.insert_before 0, Middleware::RequestLogger,
        headers: ENV.fetch("LOG_HEADERS", "User-Agent,Accept").split(",")
    end

    # Remove Rack::Lock in multi-threaded env
    unless config.allow_concurrency
      config.middleware.delete Rack::Lock
    end
  end
end
```  

This pattern helps keep your middleware configuration DRY and expressive, scaling seamlessly across staging, CI, and production.