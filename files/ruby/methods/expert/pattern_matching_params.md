## 📐 Pattern Matching in Method Signatures (Ruby 3+)
Leverage Ruby 3’s pattern matching directly in method parameters to destructure hashes and arrays, improving readability and reducing boilerplate validations.

```ruby
def handle_user({id:, name:, **extras})
  puts "ID: #{id}, Name: #{name}, Extras: #{extras.inspect}"
end

handle_user(id: 1, name: 'Bob', role: 'admin')
# => "ID: 1, Name: Bob, Extras: {:role=>\"admin\"}"
```

```ruby
def sum([first, *rest])
  rest.reduce(first) { |acc, n| acc + n }
end

puts sum([1,2,3,4])  # => 10
```