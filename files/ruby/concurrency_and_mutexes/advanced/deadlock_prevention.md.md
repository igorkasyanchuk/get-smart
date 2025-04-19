## 🛡 Deadlock Prevention with Ordered Locks and try_lock

When multiple locks may be acquired in different parts of code, enforce a global lock order or use `try_lock` with back-off to avoid deadlocks. Ordering ensures threads acquire locks predictably.

```ruby
lock_a = Mutex.new
lock_b = Mutex.new

def safe_operation(lock1, lock2)
  # Always lock in the same order
  first, second = [lock1, lock2].sort_by(&:object_id)

  if first.try_lock
    begin
      if second.try_lock
        begin
          # critical section using both locks
          yield
        ensure
          second.unlock
        end
      else
        # couldn't get second lock, back off
        sleep(0.001)
      end
    ensure
      first.unlock
    end
  else
    # couldn't get first lock, back off
    sleep(0.001)
  end
end

threads = 10.times.map do
  Thread.new do
    100.times do |i|
      safe_operation(lock_a, lock_b) do
        # perform work
        puts "Thread #{Thread.current.object_id} at iteration #{i}"
      end
    end
  end
end
threads.each(&:join)
```

By sorting locks by `object_id` and using `try_lock`, you ensure consistent ordering and non-blocking retries, effectively preventing deadlock.