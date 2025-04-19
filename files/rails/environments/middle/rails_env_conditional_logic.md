## 🔀 Use Rails.env for conditional logic

You can branch your application logic based on the current environment using `Rails.env`. This helps you enable or disable features, adjust logging, or integrate services only in specific environments. Use concise conditional blocks to keep your code clean and maintainable.

```ruby
# app/controllers/application_controller.rb
if Rails.env.production?
  # Enable performance monitoring in production
  use_performance_monitoring
elsif Rails.env.development?
  # Enable debug toolbar in development
  use_debug_toolbar
end

# Use environment-agnostic feature flag
enabled = Rails.env.test? || Rails.env.development?
```