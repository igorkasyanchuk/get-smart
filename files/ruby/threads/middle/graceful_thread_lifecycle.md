## ⏳ Graceful Thread Lifecycle & Exception Handling

Rescue exceptions inside threads to avoid silent failures, and use `join` with an optional timeout to prevent hangs in long-running operations.

```ruby
thread = Thread.new do
  begin
    # simulate work
    sleep 2
    raise "Oops!" if rand < 0.5
    puts "Work done"
  rescue => e
    warn "Thread error: #{e.message}"
  end
end

if thread.join(1)
  puts "Thread completed in time"
else
  puts "Timeout: killing thread"
  thread.kill
end
```