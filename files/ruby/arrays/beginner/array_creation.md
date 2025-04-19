## 🎉 Creating Arrays
Ruby arrays can be created using the literal syntax `[]` or the `Array.new` constructor. Literals are concise for most use cases, while `Array.new` allows you to set an initial size and a default value for each element.

```ruby
# Using a literal
fruits = ['apple', 'banana', 'cherry']

# Using Array.new for fixed size
empty_slots = Array.new(5)            # => [nil, nil, nil, nil, nil]

# With a default value
zeros = Array.new(3, 0)               # => [0, 0, 0]
```