## 🛠️ Initialize and Modify Sets

Ruby’s Set class (from the `set` stdlib) stores unique elements and provides fast lookups. You can build a set from scratch or convert an existing array, then add or delete elements dynamically.

```ruby
require 'set'

# From scratch
gems = Set.new(['rails', 'sinatra'])
gems.add('hanami')      # => #<Set: {"rails", "sinatra", "hanami"}>
gems.delete('sinatra')  # => #<Set: {"rails", "hanami"}>

# From an Array
numbers = [1, 2, 2, 3, 3, 3].to_set
numbers.add(4)          # => #<Set: {1, 2, 3, 4}>
puts numbers.include?(2) # => true
```