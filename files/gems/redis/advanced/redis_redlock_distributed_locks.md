## 🔒 Use Redlock for Robust Distributed Locks

Prevent race conditions across multiple Rails processes by implementing the Redlock algorithm on a Redis cluster. This ensures locks expire correctly and are automatically retried in case of failures.

```ruby
# Gemfile
gem 'redlock'

# config/initializers/redlock.rb
$redlock = Redlock::Client.new(
  [
    { url: ENV['REDIS_URL'] }
  ], retry_count: 3, retry_delay: 200
)

# Usage in a service
$redlock.lock!("user:#{user.id}:sync", 10_000) do |locked|
  if locked
    # perform critical operation
    user.sync_with_external_system
  else
    Rails.logger.info "Lock not acquired for user #{user.id}"
  end
end
```