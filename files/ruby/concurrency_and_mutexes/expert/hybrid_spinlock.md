## ⚙️ Hybrid Spinlock: Combining Spin‐then‐Block for Low Latency

For short‐critical sections, a pure `Mutex` can incur syscalls. Implement a spin‐then‐block strategy: spin for a few CPU cycles before falling back to blocking, reducing latency under low contention.

```ruby
require 'ffi'

module SpinLock
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :sched_yield, [], :int
end

class HybridLock
  def initialize(spin_limit = 100)
    @mutex = Mutex.new
    @spin_limit = spin_limit
    @locked = false
    @lock_mutex = Mutex.new
  end

  def lock
    @spin_limit.times do
      return if try_lock
      SpinLock.sched_yield
    end
    @mutex.lock
    @locked = true
  end

  def unlock
    if @locked
      @locked = false
      @mutex.unlock
    end
  end

  def try_lock
    @lock_mutex.synchronize do
      return false if @locked
      @locked = true
      true
    end
  end
end

# Usage
lock = HybridLock.new(200)
threads = 20.times.map { Thread.new { lock.lock; /* work */; lock.unlock } }
threads.each(&:join)
```

Spin briefly to catch fast releases; fallback to standard `Mutex` if contention persists.