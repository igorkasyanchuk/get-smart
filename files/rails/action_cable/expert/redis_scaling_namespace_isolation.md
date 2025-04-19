## 📈 Scale Action Cable with Redis Cluster and Namespace Isolation

When operating in a multi‑pod or multi‑instance setup, use a Redis Cluster for horizontal scaling and namespace isolation to avoid cross‑talk between environments or features. You can configure multiple Redis endpoints and inject a custom namespace per feature or environment to segment pub/sub traffic, reducing channel collisions and optimizing memory usage.

```yaml
# config/cable.yml
production:
  adapter: redis
  url:
    - redis://10.0.0.1:6379/1
    - redis://10.0.0.2:6379/1
    - redis://10.0.0.3:6379/1
  channel_prefix: "myapp_#{Rails.env}_action_cable"
```

```ruby
# config/initializers/redis.rb
if Rails.env.production?
  ActionCable.server.config.pubsub_adapter = :redis
  ActionCable.server.config.redis = {
    url: ENV.fetch("REDIS_URL"),
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_PEER },
    namespace: "#{Rails.application.class.module_parent_name.downcase}_#{Rails.env}_ac"
  }
end
```

This setup ensures each cluster node participates in the pub/sub ring, and the `namespace` isolates channels per environment or feature, making scaling predictable and safe.
