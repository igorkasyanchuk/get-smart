## 📊 Utilize ActiveSupport::Notifications for Performance Instrumentation
Instrument critical blocks or methods to capture custom metrics like service calls, cache hits, or algorithm timing. Subscribe to these notifications in initializers to aggregate or forward metrics to monitoring tools.

```ruby
# config/initializers/performance_subscriber.rb
ActiveSupport::Notifications.subscribe('fetch_user_data.my_app') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  Rails.logger.debug("fetch_user_data", duration: event.duration.round(1), payload: event.payload)
  StatsD.histogram('fetch_user_data.duration', event.duration)
end
```

```ruby
# in code where you fetch data
def fetch_user_data(user)
  ActiveSupport::Notifications.instrument('fetch_user_data.my_app', user_id: user.id) do
    ExternalApi.get_data(user)
  end
end
```