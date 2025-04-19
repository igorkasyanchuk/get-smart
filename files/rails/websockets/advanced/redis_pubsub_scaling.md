## 🗄️ Scaling ActionCable with Redis Pub/Sub

Configure Redis as the adapter to scale WebSocket servers horizontally and leverage Redis Pub/Sub for high-throughput message distribution. Ensure each environment isolates its channels with a prefix.

```yaml
# config/cable.yml
production:
  adapter: redis
  url: <%= ENV.fetch("REDIS_URL") %>
  channel_prefix: my_app_production
```  
```ruby
# config/initializers/action_cable.rb
Rails.application.config.after_initialize do
  ActionCable.server.config.pubsub_adapter = :redis
end
```  
Adjust Redis pool size and timeouts in `config/redis.yml` or your environment variables to match your expected connection load.