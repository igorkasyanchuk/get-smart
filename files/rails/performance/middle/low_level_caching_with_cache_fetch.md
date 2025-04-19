## 🗄️ Low-Level Caching with `Rails.cache.fetch`

Cache expensive computations or slow external calls. Use `fetch` with an expiration to store the result in your cache store and avoid repeated work.

```ruby
# Cache dashboard stats for 10 minutes
dashboard_stats = Rails.cache.fetch("dashboard_stats", expires_in: 10.minutes) do
  StatsService.calculate_all
end
```
