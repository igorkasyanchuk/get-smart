## 🔗 Implement Correlation IDs for Distributed Tracing
Inject a unique correlation ID into every request to trace execution across services and background jobs. Use a Rack middleware to generate or propagate an `X-Request-ID`, store it in `RequestStore`, and tag all log entries automatically.

```ruby
# config/initializers/correlation_id_middleware.rb
class CorrelationIdMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request_id = env['HTTP_X_REQUEST_ID'] || SecureRandom.uuid
    RequestStore.store[:request_id] = request_id
    Rails.logger.tagged(request_id) { @app.call(env) }
  ensure
    RequestStore.clear!
  end
end

Rails.application.config.middleware.insert_before Rails::Rack::Logger, CorrelationIdMiddleware
```

```ruby
# anywhere in your code
Rails.logger.info("User created", user_id: current_user.id)
# => [d290f1ee-6c54-4b01-90e6-d701748f0851] INFO -- : User created {:user_id=>42}
```