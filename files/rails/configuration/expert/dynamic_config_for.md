## 🔧 Leverage `config_for` and `config.x` for Dynamic Namespaced Configuration

Using `Rails.application.config_for` together with the `config.x` namespace lets you load and merge complex YAML configs per environment, locale, or tenant without polluting your initializers. You can deep symbolize and merge nested data structures to deliver type‑safe settings throughout your app.

In `config/payment.yml`:
```yaml
common:
  timeout: 30
  retries: 3
production:
  client_id: <%= ENV['PAYMENT_CLIENT_ID'] %>
  secret: <%= ENV['PAYMENT_SECRET'] %>
development:
  client_id: "dev_id"
  secret: "dev_secret"
```

In `config/application.rb`:
```ruby
module MyApp
  class Application < Rails::Application
    # Load and merge common + environment settings, deep symbolize keys
    raw = config_for(:payment)
    config.x.payment = raw.deep_symbolize_keys
  end
end
```

Usage anywhere in your app:
```ruby
timeout = Rails.configuration.x.payment[:timeout]
client_id = Rails.configuration.x.payment[:client_id]
```