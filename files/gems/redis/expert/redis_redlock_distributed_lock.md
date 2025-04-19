## 🔒 Distributed Locks with Redlock Algorithm

Implement the Redlock algorithm to coordinate distributed locks safely across multiple Redis nodes. This ensures mutual exclusion in high-concurrency Rails clusters and graceful lock recovery.

```ruby
# Gemfile
# gem 'redis'
# gem 'redlock'

# config/initializers/redlock.rb
require 'redlock'

LOCK_MANAGER = Redlock::Client.new(
  [ENV['REDIS_URL'], ENV['REDIS_URL_SECONDARY'], ENV['REDIS_URL_TERTIARY']],
  retry_count: 3,
  retry_delay: 200,
  retry_jitter: 50
)

# app/services/critical_section_service.rb
class CriticalSectionService
  LOCK_KEY = 'critical:section'
  TTL = 5_000 # milliseconds

  def perform
    LOCK_MANAGER.lock(LOCK_KEY, TTL) do |lock_info|
      raise 'Failed to acquire lock' unless lock_info
      # Place business-critical code here
      do_heavy_job
    end
  end

  private

  def do_heavy_job
    # ...
  end
end
```
