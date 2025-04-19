## 💾 Low-Level Cache Fetch

For caching arbitrary Ruby data or API responses, use `Rails.cache.fetch`. This method attempts to read an existing cache entry by key, and if absent, executes the block and stores its result.

```ruby
# Anywhere in your application
recent_comments = Rails.cache.fetch("recent_comments", expires_in: 10.minutes) do
  Comment.order(created_at: :desc).limit(5).to_a
end
```