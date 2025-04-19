## 🚀 Batch Fetch with `fetch_multi` to Eliminate N+1 Cache Calls`

When you need to load multiple objects, `fetch_multi` groups keys into a single round trip, drastically reducing latency. Use a single block to map missing keys to database calls, then merge results into the returned hash.

```ruby
user_ids = [1, 2, 3]
keys    = user_ids.map { |id| "user:#{id}" }

users_by_key = Rails.cache.fetch_multi(*keys, expires_in: 1.hour) do |key|
  id = key.split(':').last.to_i
  User.find(id)
end
# => {"user:1"=>#<User id:1>, ...}
```

You can further optimize by preloading associations inside the block and returning structured data for complex objects.