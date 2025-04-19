## 🔍 Embed a Custom Profiler in View Layer
Profile your view rendering breakdown by injecting a custom instrumentation subscriber. Track partial render times and template resolution overhead.

```ruby
# config/initializers/view_profiler.rb
ActiveSupport::Notifications.subscribe('render_template.action_view') do |name, started, finished, id, payload|
  duration = (finished - started) * 1000
  Rails.logger.debug "[ViewProfiler] #{payload[:identifier]} rendered in #{duration.round(1)}ms"
end
```

Add a around_filter to mark sections:

```ruby
around_action :profile_view

def profile_view
  Rails.logger.debug '--- VIEW PROFILING START ---'
  yield
  Rails.logger.debug '--- VIEW PROFILING END ---'
end
```