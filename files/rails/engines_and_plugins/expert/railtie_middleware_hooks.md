## 🧩 Inject and Reorder Middleware via Engine Railties
Expert engines can hook into the middleware stack of the host app to add or reorder middleware. Inside your engine’s Railtie, use `config.app_middleware` to precisely position your middleware relative to existing ones.

```ruby
# lib/my_engine/railtie.rb
module MyEngine
  class Railtie < ::Rails::Railtie
    initializer "my_engine.insert_middleware" do |app|
      # Insert before Rack::Runtime
      app.config.app_middleware.insert_before ActionDispatch::Static, "MyEngine::CustomLogger"

      # Swap out a default middleware
      app.config.app_middleware.swap ActionDispatch::Cookies, MyEngine::EncryptedCookies
    end
  end
end
```

This approach lets you add cross-cutting concerns like logging, rate limiting, or feature flag checks exactly where needed in the stack.