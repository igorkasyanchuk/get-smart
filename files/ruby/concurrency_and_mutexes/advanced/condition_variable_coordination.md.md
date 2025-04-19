## 🧩 Coordinating Threads with ConditionVariable

`ConditionVariable` lets threads wait for specific conditions under a `Mutex`. This is ideal for producer-consumer setups where consumers should sleep until data arrives, then process it safely.

```ruby
require 'thread'

buffer = []
mutex = Mutex.new
condition = ConditionVariable.new

# Producer thread
producer = Thread.new do
  5.times do |i|
    sleep(rand * 0.1)
    mutex.synchronize do
      buffer << i
      condition.signal  # wake one waiting consumer
      puts "Produced: #{i}"
    end
  end
end

# Consumer thread
consumer = Thread.new do
  loop do
    item = mutex.synchronize do
      # wait until buffer is not empty
      condition.wait(mutex) while buffer.empty?
      buffer.shift
    end
    puts "Consumed: #{item}"
    break if item == 4
  end
end

producer.join
consumer.join
```