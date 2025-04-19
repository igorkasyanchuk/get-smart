## 🕹 Reentrant Locks with Monitor

Ruby's built-in `Mutex` is not reentrant: a thread cannot lock the same mutex twice without deadlocking. `Monitor` (or `MonitorMixin`) solves this by allowing recursive locking within the same thread. This is useful when you have nested synchronized methods.

```ruby
require 'monitor'

class ThreadSafeCounter
  include MonitorMixin

  def initialize
    super()  # initialize the MonitorMixin
    @count = 0
  end

  def increment
    synchronize do
      @count += 1
      nested_increment
    end
  end

  def nested_increment
    synchronize do
      # Reentrant lock allows us to enter again
      @count += 1
    end
  end

  def value
    synchronize { @count }
  end
end

counter = ThreadSafeCounter.new
threads = 10.times.map do
  Thread.new { 1000.times { counter.increment } }
end
threads.each(&:join)
puts counter.value  # => 20000
```