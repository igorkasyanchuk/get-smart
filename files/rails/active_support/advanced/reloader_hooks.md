## 🔄 Hook into Rails Reloader for Clean State

Use `ActiveSupport::Reloader` callbacks to reset or reload resources between code reloads in development or between requests in certain multithreaded servers. This helps avoid stale state, especially when caching external configurations or connections.

```ruby
# config/initializers/reloader.rb
ActiveSupport::Reloader.to_prepare do
  # Reload YAML config or reset client caches
  MyFeatureFlagService.reload!
end

# Also run once at boot
ActiveSupport::Reloader.before_class_unload do
  MyFeatureFlagService.shutdown_connections!
end
```
