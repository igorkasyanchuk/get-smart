## ⚙️ Conditional Middleware Insertion
Sometimes you only need middleware in specific environments or paths (e.g., monitoring in production). Use `config.middleware.insert_before` or `insert_after` inside environment configs, or wrap registration in a condition to avoid unnecessary overhead.

```ruby
# config/environments/production.rb
if ENV['ENABLE_MONITORING'] == 'true'
  config.middleware.insert_before 0, Rack::Runtime
  config.middleware.use Monitoring::RequestTracker
end

# Alternatively, inject only for API routes in an initializer
Rails.application.config.middleware.insert_after ActionDispatch::Executor do |builder|
  if Rails.env.production?
    builder.use ApiRateLimiter, path_prefix: '/api'
  end
end
```
