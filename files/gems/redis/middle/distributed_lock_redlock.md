## 🔒 Implement Distributed Locks with Redlock

Use the redlock-rb gem to coordinate distributed locks across multiple processes. This ensures only one process can enter a critical section at a time, preventing race conditions in jobs or background workers.

```ruby
# Gemfile
gem 'redlock'

# app/services/critical_section.rb
class CriticalSection
  LOCK_MANAGER = Redlock::Client.new([ENV['REDIS_URL']])

  def perform
    LOCK_MANAGER.lock!('lock:critical_section', 2000) do
      # critical code that must not run concurrently
    end
  end
end
```