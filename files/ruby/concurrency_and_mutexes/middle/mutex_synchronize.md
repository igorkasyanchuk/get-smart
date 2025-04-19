## 🔒 Using Mutex#synchronize for Critical Sections

When multiple threads access shared data, wrapping the critical section in `Mutex#synchronize` ensures only one thread can execute it at a time. This eliminates common race conditions without manually locking and unlocking the mutex.

```ruby
require 'thread'

class Counter
  def initialize
    @count = 0
    @mutex = Mutex.new
  end

  def increment
    @mutex.synchronize do
      temp = @count
      sleep(0.01) # simulate work
      @count = temp + 1
    end
  end

  def value
    @count
  end
end

counter = Counter.new
threads = 10.times.map { Thread.new { 100.times { counter.increment } } }
threads.each(&:join)
puts counter.value # => 1000
```