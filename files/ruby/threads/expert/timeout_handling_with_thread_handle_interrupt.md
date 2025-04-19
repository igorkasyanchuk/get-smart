## ⏱️ Enforce Timeouts with Thread.handle_interrupt
To timeout blocking operations (e.g., IO, `sleep`) without leaking threads, use `Thread.handle_interrupt` to turn blocking calls into interruptible sections. This yields deterministic cancellation.

```ruby
def with_timeout(seconds)
  result = nil
  th = Thread.new do
    Thread.handle_interrupt(StandardError => :on_blocking) do
      result = yield
    end
  end

  begin
    Timeout.timeout(seconds) { th.join }
  rescue Timeout::Error
    th.raise(StandardError, "Operation timed out after #{seconds}s")
    th.join
    raise
  end

  result
end

# Usage
begin
  with_timeout(1) do
    sleep 2  # this sleep is now interruptible
    "done"
  end
rescue => e
  puts e.message  # => Operation timed out after 1s
end
```

This approach integrates Ruby’s interrupt mechanism with standard `Timeout`, avoiding orphaned threads.