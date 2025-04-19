## 🔒 Protect Shared Counter with Mutex

When multiple threads modify a shared variable, race conditions can occur. A `Mutex` ensures only one thread at a time enters a critical section. Use `Mutex#synchronize` to wrap the increment logic and keep your counter accurate.

```ruby
require 'thread'

mutex = Mutex.new
counter = 0

threads = 5.times.map do
  Thread.new do
    1000.times do
      mutex.synchronize do
        counter += 1
      end
    end
  end
end

threads.each(&:join)
puts counter  # => 5000
```