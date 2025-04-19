## 🏷️ Enhance Logs with ActiveSupport::TaggedLogging

`TaggedLogging` wraps any logger to prepend contextual tags to each message, improving traceability in multi-tenant or multi-threaded apps. You can tag by request ID, user ID, or any dynamic context. Nest tags to build hierarchical context.

```ruby
# config/environments/production.rb
config.log_tags = [ :request_id, ->(req) { req.remote_ip } ]

# Or manually:
logger = ActiveSupport::TaggedLogging.new(Rails.logger)
logger.tagged("OrderID:#{order.id}", current_user.email) do
  logger.info 'Order processed successfully'
end
```
