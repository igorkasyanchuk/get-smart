## 🔄 Dynamic Environment Switching via Middleware

For multi‑tenant or on‑demand sandbox setups, you can intercept each request and swap `Rails.env` dynamically, letting you load per‑tenant configs or credentials before the app bootstraps deeper layers.

Create a middleware at `lib/middleware/env_switcher.rb`:

```ruby
class EnvSwitcher
  def initialize(app)
    @app = app
  end

  def call(env)
    tenant = extract_tenant(env)
    original_env = Rails.env

    # e.g. set to "tenant_123"
    Rails.instance_variable_set(:@_env, ActiveSupport::StringInquirer.new(tenant))

    @app.call(env)
  ensure
    # restore original
    Rails.instance_variable_set(:@_env, ActiveSupport::StringInquirer.new(original_env))
  end

  private

  def extract_tenant(env)
    # parse subdomain or header
    ActionDispatch::Request.new(env).subdomains.first || Rails.env
  end
end
```

Then insert it early in `config/application.rb`:

```ruby
module MyApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.middleware.insert_before Rails::Rack::Logger, "EnvSwitcher"
  end
end
```
