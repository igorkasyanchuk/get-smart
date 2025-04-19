## 📦 Use Queue for Producer-Consumer

Ruby's standard `Queue` is thread-safe and ideal for producer-consumer workflows. Producers `push` items and consumers `pop`, automatically blocking when empty.

```ruby
require 'thread'

queue = Queue.new

# Producer
producer = Thread.new do
  5.times do |i|
    queue << "item_#{i}"
    puts "Produced item_#{i}"
  end
  queue << :done
end

# Consumer
consumer = Thread.new do
  loop do
    item = queue.pop
    break if item == :done
    puts "Consumed #{item}"
  end
end

producer.join
consumer.join
```