## ➖ Removing Elements
To remove items from an array, use `pop` (last), `shift` (first), or methods like `delete_at` for a specific index. Each method alters the array and returns the removed element, letting you reuse it if needed.

```ruby
letters = ['a', 'b', 'c', 'd']

# Remove last element
letters.pop        # => 'd', letters now ['a','b','c']

# Remove first element
letters.shift      # => 'a', letters now ['b','c']

# Remove at index
letters.delete_at(1) # => 'c', letters now ['b']
```