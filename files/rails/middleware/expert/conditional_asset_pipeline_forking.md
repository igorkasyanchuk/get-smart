## 🚀 Conditional Asset Pipeline Forking

When running A/B tests or multi-tenant themes, intercept asset requests and fork to different bundles without touching controllers. This middleware rewrites `env['PATH_INFO']` based on custom headers or query params, letting you serve distinct fingerprinted assets on the fly. Perfect for preview environments or dynamic theming.

```ruby
class AssetForkingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    if req.params['theme'] == 'dark'
      env['PATH_INFO'] = env['PATH_INFO'].sub(%r{^/assets/}, '/assets/dark/')
    end
    @app.call(env)
  end
end

# config/initializers/middleware.rb
Rails.application.config.middleware.insert_after ActionDispatch::Static, AssetForkingMiddleware
```