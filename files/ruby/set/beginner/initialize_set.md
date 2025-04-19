## ✨ Initialize a Set
The Set class provides a collection of unique elements, perfect for when you need to avoid duplicates. To start using it, require the built‑in library and create a new Set instance. This is a simple way to manage collections without repeated values.

```ruby
require 'set'

# Empty set
greeting_set = Set.new

# Initialize with an array (duplicates removed automatically)
greeting_set = Set.new(['hello', 'hi', 'hello'])
puts greeting_set.inspect
# => #<Set: {"hello", "hi"}>
```