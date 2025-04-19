## 🏷️ Use ActiveSupport::TaggedLogging for Contextual Logs

Tagged logging lets you add contextual information to log lines without manually interpolating strings. This is particularly useful in multi-tenant or multi-service applications where you want to trace requests through different parts of the system.

```ruby
# config/application.rb
config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

# Anywhere in your app
Rails.logger.tagged("UserID=#{current_user.id}", "OrderID=#{order.id}") do
  Rails.logger.info "Processing order"
end
```

The tags appear automatically in each line within the block, giving you structured context for filtering and analysis.