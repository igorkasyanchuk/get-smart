## 🔄 Building a ReentrantMutex with Monitor for Recursive Locks

Ruby’s `Mutex` isn’t reentrant and can deadlock if the same thread re-locks it. Use `MonitorMixin` to craft a reentrant lock that tracks ownership and recursion depth.

```ruby
require 'monitor'

class ReentrantMutex
  include MonitorMixin

  def initialize
    super() # sets up @mon_mutex and @mon_cv
    @owner = nil
    @depth = 0
  end

  def lock
    mon_enter
    begin
      if @owner == Thread.current
        @depth += 1
      else
        @cv.wait_while { @owner }
        @owner = Thread.current
        @depth = 1
      end
    ensure
      mon_exit
    end
  end

  def unlock
    mon_enter
    begin
      raise "Not owner" unless @owner == Thread.current
      @depth -= 1
      if @depth.zero?
        @owner = nil
        @cv.signal
      end
    ensure
      mon_exit
    end
  end

  def synchronize
    lock
    yield
  ensure
    unlock
  end
end

# Usage
rm = ReentrantMutex.new
rm.synchronize do
  # can call nested rm.synchronize safely
  rm.synchronize { puts "Reentered!" }
end
```

This ensures safe, recursive entry by the same thread and proper signaling upon full unlock.