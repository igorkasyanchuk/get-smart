## 🧠 Multi-Tier Caching: LocalCache + Redis

Combine the low-latency `LocalCache` (per-request) with a persistent Redis store to reduce repeated serialization/deserialization within the same request. This two-layer approach speeds up hot-key access without sacrificing cross-request persistence.

```ruby
# config/environments/production.rb
grouped_store = ActiveSupport::Cache::Strategy::LocalCache.new(
  ActiveSupport::Cache::RedisCacheStore.new(
    url: ENV['REDIS_URL'],
    namespace: 'myapp_cache'
  )
)
Rails.application.config.cache_store = grouped_store
```

Now, the first fetch in a request hits Redis, and subsequent fetches for the same key use the in-memory cache, reducing network hops.