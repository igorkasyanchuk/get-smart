## 🛠️ Bypass Marshal Overhead with Raw JSON Storage

By default Rails serializes objects with Marshal, which can be slow. You can configure your cache store to use JSON serialization or even write/read raw strings directly for simple data structures.

```ruby
# config/initializers/cache_store.rb
Rails.application.config.cache_store = :mem_cache_store,
  "localhost:11211", serializer: JSON, compress: false

# Write and read raw JSON
stats = { users: 1_000_000, rate: 0.85 }
Rails.cache.write("app_stats", stats.to_json, raw: true)

json = Rails.cache.read("app_stats", raw: true)
stats = JSON.parse(json, symbolize_names: true)
```

`raw: true` skips Rails’ normal serialization pipeline, reducing CPU and memory usage.