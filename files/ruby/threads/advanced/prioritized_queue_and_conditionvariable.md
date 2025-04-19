## 🚦 Prioritized Producer-Consumer with Mutex and ConditionVariable

Implement a custom priority queue using `Mutex` and `ConditionVariable` to signal consumers only when high-priority items arrive. This avoids busy-waiting and ensures correct ordering.

```ruby
class PriorityQueue
  def initialize
    @queue = []
    @mutex = Mutex.new
    @cond  = ConditionVariable.new
  end

  # Producer pushes items with integer priority (higher is more urgent)
  def push(item, priority)
    @mutex.synchronize do
      @queue << [priority, item]
      @queue.sort_by!(&:first).reverse!
      @cond.signal
    end
  end

  # Consumer pops highest-priority item, waits if empty
  def pop
    @mutex.synchronize do
      @cond.wait(@mutex) while @queue.empty?
      @queue.shift.last
    end
  end
end

# Example usage:
queue = PriorityQueue.new

# Producer thread
t1 = Thread.new do
  queue.push('low-task', 1)
  queue.push('high-task', 10)
end

# Consumer thread
t2 = Thread.new do
  puts queue.pop  # => 'high-task'
  puts queue.pop  # => 'low-task'
end

t1.join; t2.join
```