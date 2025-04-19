## ⚙️ Database Connection Pool Tuning

Properly configuring your connection pool prevents request queuing and timeouts under load. Adjust `pool`, `checkout_timeout`, and monitor `ActiveRecord::Base.connection_pool.stat` to find bottlenecks and leaks.

```yaml
# config/database.yml
production:
  adapter: postgresql
  database: myapp_production
  pool: 20        # max connections per process
  checkout_timeout: 5  # seconds to wait for a free connection
```

```ruby
# Monitor in an initializer
Rails.application.config.after_initialize do
  Thread.new do
    loop do
      stats = ActiveRecord::Base.connection_pool.stat
      Rails.logger.info "DB Pool: #{stats}"  # busy, size, dead
      sleep 30
    end
  end
end
```