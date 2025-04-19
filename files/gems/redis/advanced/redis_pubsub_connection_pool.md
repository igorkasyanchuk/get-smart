## 📣 Optimize Pub/Sub with Connection Pooling

Avoid blocking your primary Redis connection by creating a dedicated, pooled client for Pub/Sub patterns. Use `connection_pool` to manage subscribers in background threads efficiently.

```ruby
# Gemfile
gem 'connection_pool'

# config/initializers/redis_pubsub.rb
PUBSUB_POOL = ConnectionPool.new(size: 5, timeout: 5) do
  Redis.new(url: ENV['REDIS_URL'])
end

# Subscriber service
Thread.new do
  PUBSUB_POOL.with do |conn|
    conn.subscribe('notifications') do |on|
      on.message do |channel, msg|
        data = JSON.parse(msg)
        NotificationDispatcher.call(data)
      end
    end
  end
end

# Publishing
Redis.new(url: ENV['REDIS_URL']).publish('notifications', { user: 1, action: 'login' }.to_json)
```