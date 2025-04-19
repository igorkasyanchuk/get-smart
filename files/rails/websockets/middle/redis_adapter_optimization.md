## ⚡ Optimizing Action Cable Performance with Redis

For production workloads, use the Redis adapter to scale horizontally and handle high throughput. Configure namespaces and multiple Redis instances to segment pub/sub traffic.

```yaml
# config/cable.yml
production:
  adapter: redis
  url: redis://localhost:6379/1
  channel_prefix: myapp_production

# You can use a separate instance for pub/sub:
# url: redis://redis-pubsub.example.com:6379/2
```