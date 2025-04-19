## 🔀 Use Array Destructuring and Splat for Flexible Assignments

Ruby’s multiple assignment combined with the splat operator (`*`) lets you unwrap arrays concisely, extract head/tail elements, or group remaining items without verbose loops.

```ruby
# Basic parallel assignment
a, b = [1, 2]         # a = 1, b = 2

# Splat to capture rest of the array
first, *middle, last = [1, 2, 3, 4, 5]
# first = 1, middle = [2, 3, 4], last = 5

# Swap variables without temp
a, b = b, a

# Unpack arguments in method definition
def process(title, *tags)
  puts "#{title} (tags: #{tags.join(', ')})"
end

process('Rails Tips', 'ruby', 'rails', 'performance')
```