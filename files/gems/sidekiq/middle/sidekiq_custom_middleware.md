## 🧩 Inject Custom Server Middleware
Sidekiq middleware hooks let you execute code around job invocation. Use server middleware to add logging, metrics, or pass per-job context like request IDs.

```ruby
# lib/sidekiq/server_middleware/request_context.rb
class RequestContextMiddleware
  def call(worker, msg, queue)
    RequestStore.store[:request_id] = msg['request_id']
    yield
  ensure
    RequestStore.store.clear
  end
end

# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add RequestContextMiddleware
  end
end
```
