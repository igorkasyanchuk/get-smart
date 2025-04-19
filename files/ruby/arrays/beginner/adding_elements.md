## ➕ Adding Elements
To grow an array, use `push` or the shovel operator (`<<`) to append, and `unshift` to prepend. These methods modify the array in place and return the array itself, making chaining possible.

```ruby
numbers = [2, 3]

# Append to end
numbers.push(4)    # => [2, 3, 4]
numbers << 5        # => [2, 3, 4, 5]

# Prepend to start
numbers.unshift(1)  # => [1, 2, 3, 4, 5]
```