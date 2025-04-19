## 🔍 Accessing Elements
You can retrieve elements by their index, where Ruby arrays are zero-indexed. Negative indices start counting from the end, and methods like `first`, `last`, or `fetch` give more control or safer access with defaults.

```ruby
colors = ['red', 'green', 'blue']

# By index
colors[0]        # => 'red'
colors[-1]       # => 'blue'

# Using helper methods
colors.first     # => 'red'
colors.last      # => 'blue'

# Safe fetch with default
colors.fetch(5, 'unknown')  # => 'unknown'
```