## 🔄 Symbol-to-Proc for Concise Iteration

The `&:symbol` shorthand converts a symbol to a proc (`{ |obj| obj.symbol }`), drastically reducing boilerplate in enumerable chains. Under the hood, Ruby calls `to_proc` on the symbol.

```ruby
users = [{name: "Alice"}, {name: "Bob"}, {name: "Eve"}]
names = users.map(&[:name].method(:[])) # Explicit proc from Array#[]
puts names.inspect # => ["Alice", "Bob", "Eve"]

# More common usage:
words = %w[one two three]
lengths = words.map(&:length)
puts lengths.inspect # => [3, 3, 5]
```