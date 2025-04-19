## 🚀 Custom Queue Configuration

Solid Queue lets you tailor queue behavior globally or per job. You can set a namespace, pool size, and default queue to match your application's throughput requirements. Override these settings on the fly for specific tasks.

```ruby
# config/initializers/solid_queue.rb
Solid::Queue.configure do |config|
  config.namespace      = 'my_app'
  config.pool_size      = 10       # number of worker threads
  config.default_queue  = 'critical'
  config.redis_url      = 'redis://localhost:6379/1'
end

# Enqueue with a custom queue
Solid::Queue.enqueue(MyWorker, args: {user_id: 42}, queue: 'low_priority')
```