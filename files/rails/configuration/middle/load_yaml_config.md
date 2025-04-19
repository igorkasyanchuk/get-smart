## 📂 Load Environment‑Specific YAML with `config_for`

When you have complex settings in a YAML file (e.g., API credentials, feature toggles), use `Rails.application.config_for` to load them per environment without extra parsing code. Place your YAML in `config/` and call `config_for` in an initializer or directly in your classes.

```yaml
# config/services.yml
development:
  mailchimp_api_key: dev-abc123
production:
  mailchimp_api_key: prod-xyz789
```

```ruby
# config/initializers/services.rb
SERVICE_CONFIG = Rails.application.config_for(:services)
# Now SERVICE_CONFIG[:mailchimp_api_key] returns the correct key per ENV
```

Use `SERVICE_CONFIG` in your mailers or jobs to keep secrets out of code and reduce boilerplate.