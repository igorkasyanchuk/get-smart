## 🛠️ Insert Middleware at Specific Points

Rails lets you precisely position middleware relative to built‑in components using `insert_before` and `insert_after`. This is especially useful when you depend on data set up by another middleware or need to wrap its behavior.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Run custom auth check before Rack::Runtime sets X-Runtime
    config.middleware.insert_before Rack::Runtime, AuthCheckMiddleware

    # Or run a response sanitizer after ActionDispatch::Static serves files
    config.middleware.insert_after ActionDispatch::Static, ResponseSanitizer
  end
end
```

The order you inject matters: use `insert_before` to run yours earlier, and `insert_after` to wrap on the way out.