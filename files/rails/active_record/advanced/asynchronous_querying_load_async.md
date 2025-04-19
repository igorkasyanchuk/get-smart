## 📦 Asynchronous Querying with `load_async`

Rails 7 introduces `load_async` to fetch records in the background, reducing request latency by overlapping I/O. Use it for non‑blocking data loads.

```ruby
# Fire off the query but don't block immediately
users_relation = User.where(active: true).load_async

# Do other work here...

# Wait for results when needed
users = users_relation.to_a
```