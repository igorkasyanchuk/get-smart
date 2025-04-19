## 🏷️ Contextual Tagging and Selective Silencing
ActiveSupport::TaggedLogging helps you wrap logs with contextual tags, while the `silence` method suppresses noise (e.g., asset requests) below a given severity. Combine both to keep logs focused.

```ruby
# config/application.rb
logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
Rails.logger = logger
``` 

```ruby
# In a controller or service
Rails.logger.tagged("OrderID:#{order.id}", "User:#{current_user.id}") do
  Rails.logger.info "Processing order"
  # Temporarily silence DEBUG logs
  Rails.logger.silence(Logger::WARN) do
    Rails.logger.debug "This debug entry won’t appear"
  end
  Rails.logger.warn "Potential risk detected"
end
```