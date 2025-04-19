## 🔗 Build a Cyclic Barrier with Mutex and ConditionVariable
When you need N threads to rendezvous at multiple synchronization points, implement a reusable barrier. Threads block until the last participant arrives, then all proceed. This is critical for staged parallel algorithms.

```ruby
require 'thread'

class CyclicBarrier
  def initialize(parties)
    @parties = parties
    @count    = parties
    @mutex    = Mutex.new
    @cond     = ConditionVariable.new
  end

  def wait
    @mutex.synchronize do
      @count -= 1
      if @count.zero?
        @count = @parties
        @cond.broadcast
      else
        @cond.wait(@mutex)
      end
    end
  end
end

# Usage
barrier = CyclicBarrier.new(3)

3.times.map do |i|
  Thread.new do
    5.times do |round|
      sleep rand(0.1)
      puts "Thread #{i} reached barrier #{round}"
      barrier.wait
# All threads proceed together
    end
  end
end.each(&:join)
```

This pattern avoids busy-waiting and allows multiple reuse of the same barrier.