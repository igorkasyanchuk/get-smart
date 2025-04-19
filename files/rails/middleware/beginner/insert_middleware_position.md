## 🔀 Inserting Middleware at a Specific Position

By default, `config.middleware.use` appends your middleware to the end of the stack. You can precisely control ordering with `insert_before` or `insert_after`. This helps when you need your middleware to run at a specific stage (e.g., before routing or response compression).

```ruby
# config/application.rb
module YourApp
  class Application < Rails::Application
    # Insert before Rack::Runtime to run early
    config.middleware.insert_before Rack::Runtime, MyCustomMiddleware

    # Or insert after ActionDispatch::Static to modify responses
    config.middleware.insert_after ActionDispatch::Static, MyCustomMiddleware
  end
end
```