## 🌐 Integrate with a Redis Cluster Seamlessly

Connect Rails cache and Sidekiq to a Redis Cluster for high availability and horizontal scaling. Use `redis-client` to automatically route commands and manage slots.

```ruby
# Gemfile
gem 'redis-client', '~> 0.10'

# config/initializers/redis.rb
RedisClient.new(
  nodes: [
    { host: '10.0.0.1', port: 6379 },
    { host: '10.0.0.2', port: 6379 }
  ],
  support_redirection: true
).tap do |client|
  Rails.application.config.cache_store = :redis_cache_store,
    { client: client, expires_in: 1.hour }
  Sidekiq.configure_server do |config|
    config.redis = { client: client }
  end
  Sidekiq.configure_client do |config|
    config.redis = { client: client }
  end
end
```