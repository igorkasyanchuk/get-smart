## 🎟️ Implementing a Fair FIFO Mutex with ConditionVariable

Standard `Mutex` can starve threads under heavy load. Use a FIFO queue and `ConditionVariable` to grant lock ownership in arrival order, ensuring fairness and predictable throughput.

```ruby
class FairMutex
  def initialize
    @queue = []
    @cv = ConditionVariable.new
    @lock = Mutex.new
  end

  def synchronize
    @lock.synchronize do
      thread_id = Thread.current.object_id
      @queue << thread_id
      @cv.wait(@lock) until @queue.first == thread_id
      begin
        yield
      ensure
        @queue.shift
        @cv.broadcast
      end
    end
  end
end

# Usage
a_mutex = FairMutex.new
threads = 10.times.map do
  Thread.new { a_mutex.synchronize { puts "Thread #{Thread.current.object_id} acquired" } }
end
threads.each(&:join)
```

This ensures no thread bypasses the queue. The `broadcast` wakes all waiters but only the head acquires the lock next.