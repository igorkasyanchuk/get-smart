## 📣 Coordinating Threads with ConditionVariable

Use `ConditionVariable` in conjunction with a `Mutex` to signal between producer and consumer threads. This pattern avoids busy‑waiting and lets consumers sleep until work is available.

```ruby
require 'thread'

mutex = Mutex.new
condition = ConditionVariable.new
queue = []

producer = Thread.new do
  5.times do |i|
    sleep(rand * 0.1)
    mutex.synchronize do
      queue << i
      puts "Produced #{i}"
      condition.signal
    end
  end
end

consumer = Thread.new do
  loop do
    item = nil
    mutex.synchronize do
      condition.wait(mutex) while queue.empty?
      item = queue.shift
n    end
    puts "Consumed #{item}" if item
    break if item == 4
  end
end

producer.join
consumer.join
```