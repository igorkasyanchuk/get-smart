## 🧩 Enrich SQL Query Logs with Context

Use `ActiveSupport::Notifications` to subscribe to SQL events and append controller/action or custom attributes. This enables you to trace which endpoint triggered expensive queries across your logs or monitoring dashboards.

```ruby
# config/initializers/sql_logger.rb
ActiveSupport::Notifications.subscribe('sql.active_record') do |name, start, finish, id, payload|
  next if payload[:name] == 'SCHEMA'

  duration = ((finish - start) * 1000).round(1)
  context = Thread.current[:log_context] || {}
  Rails.logger.info("SQL (#{duration}ms) [#{payload[:name]}] #{payload[:sql]} | Context: #{context.to_json}")
end

# In ApplicationController
before_action do
  Thread.current[:log_context] = { user_id: current_user.id, action: action_name }
end
```