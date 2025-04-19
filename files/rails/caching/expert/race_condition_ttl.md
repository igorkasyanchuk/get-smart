## 🔥 Mitigate Cache Stampede with `:race_condition_ttl`

When multiple processes miss the cache simultaneously, you risk a thundering herd hitting your database. Rails 5.2+ introduces the `:race_condition_ttl` option to serve stale data for a short window while one process regenerates fresh data in the background. This balances consistency and performance under high load.

```ruby
# Return stale value for up to 10s while a single process recomputes
Rails.cache.fetch("expensive_report", expires_in: 5.minutes, race_condition_ttl: 10.seconds) do
  ExpensiveService.generate_report
end
```

You can also hook into `ActiveSupport::Notifications` to log or enqueue background jobs when regeneration begins.