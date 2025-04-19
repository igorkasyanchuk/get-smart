## 🛡️ Tenant-Isolated Sidekiq Queues with Redis Namespaces

In multi-tenant architectures you can isolate Sidekiq data by using Redis namespaces per tenant. This ensures no cross-tenant data bleed and allows independent scaling and purging.

```ruby
# Gemfile
gem 'redis-namespace'

# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  tenant_id = ENV.fetch('CURRENT_TENANT')
  config.redis = { url: ENV['REDIS_URL'], namespace: "sidekiq:#{tenant_id}" }
end

Sidekiq.configure_client do |config|
  tenant_id = ENV.fetch('CURRENT_TENANT')
  config.redis = { url: ENV['REDIS_URL'], namespace: "sidekiq:#{tenant_id}" }
end
```