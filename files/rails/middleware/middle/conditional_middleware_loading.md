## ⚙️ Load Middleware Conditionally

You can register middleware only in specific environments or when certain feature flags are enabled. This keeps development lean and avoids overhead where you don't need it.

```ruby
# config/environments/production.rb
Rails.application.configure do
  # Enable response compression only in production
  config.middleware.use Rack::Deflater

  # Custom metrics only when METRICS_ENABLED env var is true
  if ENV['METRICS_ENABLED'] == 'true'
    config.middleware.use MetricsCollector
  end
end
```

By scoping registration this way, you avoid polluting the stack in test or development modes.