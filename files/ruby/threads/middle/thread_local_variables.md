## 🧵 Leverage Thread-local Variables

Store per-thread data using `Thread#[]` to avoid cross-talk. This is handy for caching or context passing without global state.

```ruby
Thread.new do
  Thread.current[:request_id] = SecureRandom.uuid
  puts "Handling request #{Thread.current[:request_id]}"
  # ... perform work, other methods can read Thread.current[:request_id]
end.join
```

Each thread has its own `:request_id`, so you can safely log or track data without collisions.