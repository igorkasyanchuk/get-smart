## ⚙️ Iterating with Range#step

Ruby’s `Range#step` method yields values at regular intervals without building the entire array in memory. This is ideal for generating sequences like timestamp intervals or samples. You can specify any positive or negative step size, and even pass a block to process each value lazily.

```ruby
# Print every 5th number between 0 and 50
enum = (0..50).step(5)
enum.each { |n| puts n }

# Generate descending values
desc = (10).downto(0).step(2).to_a  # => [10, 8, 6, 4, 2, 0]
```