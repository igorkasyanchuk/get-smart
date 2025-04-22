## 🔒 Use Redlock for distributed locking

Prevent race conditions in multi-instance setups by using the Redlock algorithm to acquire distributed locks on critical sections. This ensures only one process can perform a job at a time, avoiding duplicate work or data corruption.

```ruby
# Gemfile
gem 'redlock'

# Usage in your code
redlock = Redlock::Client.new([ENV['REDIS_URL']])
redlock.lock!('lock:generate_report', 5_000) do
  # critical section: generate and save report
  ReportGenerator.new.call
end
```
