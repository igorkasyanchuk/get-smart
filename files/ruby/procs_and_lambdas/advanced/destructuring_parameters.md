## 🎯 Destructuring Parameters in Lambdas
Ruby 2.7+ allows you to destructure arrays and hashes directly in lambda parameters, making handlers and callbacks concise and self-documenting. This is extremely handy when working with complex data structures.

```ruby
# Array destructuring
parser = ->((x, y, z)) { "Coords: #{x},#{y},#{z}" }
puts parser.call([1, 2, 3])  # => "Coords: 1,2,3"

# Hash destructuring with keyword args
renderer = ->(title:, content:) {
  "<h1>#{title}</h1><p>#{content}</p>"
}
puts renderer.call(title: "Hi", content: "World")
```