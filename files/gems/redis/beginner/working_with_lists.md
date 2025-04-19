## 📋 Working with Lists

Redis lists are ordered collections you can push and pop from. Use `lpush` to add items to the head and `lrange` to retrieve a range of elements.

```ruby
# Push items onto a list
redis.lpush("tasks", "task1")
redis.lpush("tasks", "task2")

# Get all items
tasks = redis.lrange("tasks", 0, -1)
puts tasks # => ["task2", "task1"]
```
