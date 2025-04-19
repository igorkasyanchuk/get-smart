## 🗂️ Structured Logging with Lograge
By replacing Rails’ default multi-line logs with Lograge, you get single-line, JSON-formatted entries ideal for log aggregation and analysis. Customize Lograge to include parameters, request IDs, and custom fields.

Example configuration in `config/environments/production.rb`:

```ruby
# Gemfile
gem 'lograge'
```

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  # Add custom payload data
  config.lograge.custom_payload do |controller|
    {
      user_id: controller.current_user&.id,
      host: controller.request.host
    }
  end

  # Filter out sensitive parameters
  config.lograge.custom_options = lambda do |event|
    { params: event.payload[:params].except('password', 'credit_card') }
  end
end
```