## 🕵️ Compose LocalCache with Remote Store for Ultra-Fast Reads

Use `ActiveSupport::Cache::Strategy::LocalCache` in front of your remote cache to ensure each request hits the remote store only once per key, then serves subsequent reads from thread-local memory.

```ruby
# config/initializers/cache_strategy.rb
remote_store = ActiveSupport::Cache.lookup_store(:mem_cache_store, "localhost:11211", namespace: "my_app_v1")
local_plus_remote = ActiveSupport::Cache::Strategy::LocalCache.new(remote_store)
Rails.application.config.cache_store = local_plus_remote

# In a controller or model
Rails.cache.fetch("user:#{current_user.id}") { current_user.to_h }
# Subsequent reads in the same request are served from LocalCache
```

This pattern drastically reduces round trips to your cache node, especially in views or service objects that repeatedly access the same keys.