## 🔧 Environment-Specific YAML Config with `config_for`

Rails 5.2+ provides `Rails.application.config_for` to load deeply nested, environment-scoped settings from a single YAML file. This keeps your configuration DRY and avoids littering ENV lookups throughout your app. Define your settings in `config/feature_flags.yml`, then load them in an initializer.

```yaml
# config/feature_flags.yml
development:
  new_dashboard: true
  api_rate_limit: 100
staging:
  new_dashboard: true
  api_rate_limit: 50
production:
  new_dashboard: false
  api_rate_limit: 10
```

```ruby
# config/initializers/feature_flags.rb
FEATURE_FLAGS = Rails.application.config_for(:feature_flags)
Rails.logger.info "Loaded feature flags: #{FEATURE_FLAGS.inspect}"
```

```ruby
# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    if FEATURE_FLAGS['new_dashboard']
      render :new_dashboard
    else
      render :legacy_dashboard
    end
  end
end
```
