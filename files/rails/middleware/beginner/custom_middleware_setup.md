## 🚀 Creating and Registering Custom Middleware

Custom middleware lets you hook into every request before it reaches your controllers. You define a class with an `initialize` and `call` method, then insert it into the middleware stack. This is perfect for lightweight logging, request transformations, or condition checks.

```ruby
# lib/my_custom_middleware.rb
class MyCustomMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info "[MyCustomMiddleware] Request Path: #{env['PATH_INFO']}"
    @app.call(env)
  end
end

# config/application.rb
module YourApp
  class Application < Rails::Application
    # Ensure 'lib' is autoloaded
    config.autoload_paths << Rails.root.join('lib')
    # Register your middleware
    config.middleware.use MyCustomMiddleware
  end
end
```