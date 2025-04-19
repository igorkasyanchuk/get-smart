## 🔧 Optimize Puma & DB Connection Pool

Align Puma's thread count with ActiveRecord's connection pool to avoid connection starvation and thread blocking under high concurrency.

```ruby
# config/puma.rb
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 16 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

workers ENV.fetch("WEB_CONCURRENCY") { 4 }
preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
```

```yaml
# config/database.yml
production:
  <<: *default
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 16 } %>
```

Choosing `threads = pool size` and `workers > 1` maximizes utilization without queuing requests behind DB locks.