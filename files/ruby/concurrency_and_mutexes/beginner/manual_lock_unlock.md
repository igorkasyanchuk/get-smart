## 🤝 Manually Lock and Unlock

While `synchronize` is concise, you can manually call `lock` and `unlock` for more control. Always use an `ensure` block to guarantee the mutex is released, even if an exception is raised.

```ruby
require 'thread'

mutex = Mutex.new

def safe_update(mutex)
  mutex.lock
  begin
    # critical code here
    puts "Working in thread #{Thread.current.object_id}"
  ensure
    mutex.unlock
  end
end

threads = 3.times.map { Thread.new { safe_update(mutex) } }
threads.each(&:join)
```