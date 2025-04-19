## 🔒 Implement Two-Level Caching with Redis & MemoryStore

Combine a process‑local LRU cache with a shared Redis layer to achieve sub-millisecond hits for hot objects and still benefit from cross‑process cache warming.

```ruby
# config/initializers/cache_stores.rb
Rails.application.config.cache_store = :redis_cache_store,
  { url: ENV['REDIS_URL'], namespace: 'cache', expires_in: 12.hours }

MemoryStore = ActiveSupport::Cache::MemoryStore.new(size: 64.megabytes)

module TwoLevelCache
  def self.read(key)
    MemoryStore.fetch(key) do
      Rails.cache.read(key)
    end
  end

  def self.write(key, value)
    MemoryStore.write(key, value)
    Rails.cache.write(key, value)
  end
end
```

```ruby
# Usage
TwoLevelCache.write('user:42', user_json)
json = TwoLevelCache.read('user:42')
```

This arrangement slashes average latency under high QPS while maintaining a fallback to Redis on process restarts.