## 🗂️ Create a High-Performance Thread-Safe LRU Cache Using Monitor
For a high-throughput shared cache with eviction, implement an LRU cache using a hash and a doubly-linked list behind `MonitorMixin`. This avoids full-collection locks and supports reentrant calls.

```ruby
require 'monitor'

class LRUCache
  include MonitorMixin

  Node = Struct.new(:key, :value, :prev, :next)

  def initialize(max_size)
    super()  # init MonitorMixin
    @max_size = max_size
    @map      = {}
    @head     = Node.new(nil, nil)
    @tail     = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    synchronize do
      node = @map[key] or return nil
      remove(node)
      insert_front(node)
      node.value
    end
  end

  def set(key, value)
    synchronize do
      if (node = @map[key])
        node.value = value
        remove(node)
        insert_front(node)
      else
        node = Node.new(key, value)
        @map[key] = node
        insert_front(node)
        evict if @map.size > @max_size
      end
    end
  end

  private

  def remove(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def insert_front(node)
    node.next       = @head.next
    node.prev       = @head
    @head.next.prev = node
    @head.next      = node
  end

  def evict
    lru = @tail.prev
    remove(lru)
    @map.delete(lru.key)
  end
end

# Usage
cache = LRUCache.new(100)
threads = 10.times.map do |i|
  Thread.new do
    key = "item_#{i % 50}"
    cache.set(key, "value_#{i}")
    puts cache.get(key)
  end
end
threads.each(&:join)
```

Using `MonitorMixin` ensures reentrancy and fairness, while the internal list structure delivers constant-time get/set and eviction.