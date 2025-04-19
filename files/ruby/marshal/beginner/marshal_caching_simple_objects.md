## 📦 Simple Object Caching with Marshal

Use Marshal to cache frequently used objects in memory or on disk. Because marshaled data is compact, it speeds up loading configurations or computed results. Just remember that only Ruby-built or user‑defined serializable classes work out of the box.

```ruby
cache_file = "user_cache.bin"

# Populate cache if missing
data = if File.exist?(cache_file)
  File.open(cache_file, "rb") { |f| Marshal.load(f) }
else
  user_list = fetch_users_from_api()  # expensive call
  File.open(cache_file, "wb") { |f| f.write(Marshal.dump(user_list)) }
  user_list
end
puts "Loaded #{data.size} users from cache"
```