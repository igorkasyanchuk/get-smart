## ⚡ Batch Fetch with fetch_multi and Namespaced Caching

Rails.cache provides `fetch_multi` for reducing N+1 cache reads by fetching multiple keys in a single call. Combine this with namespacing and versioning to safely expire segments of your cache without clearing everything. Great for preloading associations or bulk lookups.

```ruby
keys = %i[user_1 user_2 user_3]
users = Rails.cache.fetch_multi(*keys, namespace: 'v2', expires_in: 6.hours) do |key|
  id = key.to_s.split('_').last.to_i
  User.includes(:profile).find(id)
end
# users is a hash: { user_1: <User id=1>, ... }
```
