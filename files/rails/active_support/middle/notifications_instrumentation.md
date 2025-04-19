## 📣 Instrument and Subscribe with `ActiveSupport::Notifications`
Leverage Rails’ built-in instrumentation to monitor and log key events without tight coupling. Use `instrument` to wrap code and `subscribe` to react to events anywhere in your application.

```ruby
# Subscribe globally (e.g., in an initializer)
ActiveSupport::Notifications.subscribe('process.action_controller') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  Rails.logger.info "Processed \\#{event.payload[:path]} in \\#{event.duration.round(1)}ms"
end

# Instrument custom code
ActiveSupport::Notifications.instrument('custom.event', foo: 'bar') do
  sleep(0.1)
end
```
