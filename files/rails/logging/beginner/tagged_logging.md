## 🏷️ Using Tagged Logging
Tagged logging helps you group related log lines with custom tags like request IDs or user IDs. It makes filtering logs easier when troubleshooting.

```ruby
# config/application.rb
Rails.application.configure do
  config.log_tags = [:request_id]
end

# In your code
Rails.logger.tagged("PAYMENTS") do
  Rails.logger.info "Payment processed for order 123"
end
```
