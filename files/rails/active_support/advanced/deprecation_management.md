## 🚨 Manage and Route Deprecation Warnings

ActiveSupport::Deprecation lets you control how deprecation notices are handled—log, stderr, notify, or raise. You can subscribe to the `deprecation.rails` event to forward warnings to an external monitoring service and enforce cleanup policies.

```ruby
# config/initializers/deprecation.rb
ActiveSupport::Deprecation.behavior = [:stderr, :log]

ActiveSupport::Notifications.subscribe('deprecation.rails') do |_name, _start, _finish, _id, payload|
  Rails.logger.warn("DEPRECATION: #{payload[:message]} (called from #{payload[:callstack].first})")
  MyErrorTracker.notify(:warning, payload[:message])
end
```
