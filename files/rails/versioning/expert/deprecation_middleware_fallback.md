## ⚠️ Deprecation Middleware with Fallback Strategy
Introduce a lightweight Rack middleware that flags deprecated API versions in response headers and optionally reroutes to a newer version. This approach centralizes lifecycle management, injects `Deprecation` headers, and provides a controlled fallback for clients stuck on old versions.

```ruby
# lib/middleware/api_deprecation.rb
class ApiDeprecation
  def initialize(app)
    @app = app
  end

  def call(env)
    version = env['api.version']
    if deprecated?(version)
      status, headers, body = @app.call(env)
      headers['Deprecation'] = "You are using v#{version}, use v#{version + 1}"
      [status, headers, body]
    else
      @app.call(env)
    end
  end

  private

  def deprecated?(v)
    v.to_i < CURRENT_STABLE_VERSION
  end
end
```

And mount it in `config/application.rb`:

```ruby
config.middleware.use "ApiDeprecation"
```
