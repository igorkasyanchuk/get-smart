## 🔀 Dynamic Worker Selection Based on Payload

For complex workflows, you can route jobs to different workers dynamically based on message content. This approach reduces conditional logic inside workers and centralizes routing rules. Use a custom client middleware or publisher wrapper to inspect the payload and enqueue the proper worker.

```ruby
# lib/middleware/dynamic_router_middleware.rb
class DynamicRouterMiddleware
  def call(env, next_middleware)
    job_type = env[:payload]['type']
    worker = case job_type
             when 'email'  then EmailSenderWorker
             when 'report' then ReportGeneratorWorker
             else DefaultWorker
             end

    # Re-enqueue under chosen worker
    SolidQueue.enqueue(worker, env[:payload], headers: env[:headers])
  end
end
```

```ruby
# config/initializers/solid_queue.rb
SolidQueue.configure do |config|
  config.client_middleware.use DynamicRouterMiddleware
end
```