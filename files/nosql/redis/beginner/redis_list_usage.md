## 📋 Working with Lists

Redis lists let you push and pop elements in a FIFO or LIFO fashion. They’re great for implementing simple queues or stacks without a full message broker.

```ruby
# Add tasks to the left of the list (acts like a stack)
redis.lpush("tasks", "task1", "task2")

# Fetch all items (0..-1 returns entire list)
puts redis.lrange("tasks", 0, -1)  # => ["task2", "task1"]

# Pop the rightmost element (acts like a queue)
puts redis.rpop("tasks")  # => "task1"
```