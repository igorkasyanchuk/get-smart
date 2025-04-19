## 🚀 Scaling ActionCable with Redis Sentinel and Pub/Sub
Leverage Redis Sentinel for high availability and automatic failover when scaling WebSocket servers. Configure multiple Sentinel instances in `config/cable.yml` and handle dynamic master discovery for robust Pub/Sub.

```yaml
# config/cable.yml
development:
  adapter: redis
  url: redis://master-redis.example.com:6379/1
  channel_prefix: myapp_development
  sentinel:
    hosts:
      - host: sentinel1.example.com
        port: 26379
      - host: sentinel2.example.com
        port: 26379
    role: master
```

```ruby
# config/initializers/redis.rb
ActionCable.server.config.redis = {
  url: nil,
  sentinels: Rails.application.config_for(:cable)['development']['sentinel']['hosts'],
  role: :master,
  password: ENV['REDIS_PASSWORD']
}
```

This setup ensures ActionCable auto-detects the current master Redis node and reconnects seamlessly if a failover occurs.