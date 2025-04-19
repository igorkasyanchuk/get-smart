## ⚡ Low-Level Caching with Race-Condition TTL

For high-traffic endpoints where cache stampedes are a concern, use `race_condition_ttl` to prevent multiple processes from recomputing stale data concurrently. This option lets an expired entry remain valid for a short grace period while a single request refreshes it.

```ruby
# Fetch or compute a heavy payload
Rails.cache.fetch("heavy_report", expires_in: 1.hour, race_condition_ttl: 10.seconds) do
  compute_heavy_report
end
```

This ensures if the cache expires, the first process enters the block and others use the stale value for up to 10 seconds, drastically reducing DB load.