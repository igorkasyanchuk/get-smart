## 📡 ActiveSupport::Notifications Debugging

ActiveSupport::Notifications provide a pub/sub hook into Rails internals. By subscribing to key events like `process_action.action_controller` or `sql.active_record`, you can capture performance data and full payload context, then drop into a debugger on specific conditions.

```ruby
# In Rails console or an initializer
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |_name, start, finish, id, payload|
  duration = (finish - start) * 1000.0
  if duration > 500 # ms threshold
    puts "Slower than expected: ", payload
    require 'byebug'; byebug
  end
end

# You can also subscribe in code to inspect only certain controllers
ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
  name, start, finish, id, payload = args
  if payload[:sql] =~ /UPDATE/ && payload[:binds].any?
    binding.byebug
  end
end
```

This approach dynamically halts your app when specific events occur, giving you a full payload in context. Perfect for isolating troublesome slow actions or unexpected data mutations.