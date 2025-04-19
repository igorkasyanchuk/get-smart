## 🔥 Advanced Parameter Destructuring in Blocks

Ruby lets you destructure nested arrays and hashes right in block parameters, making code concise and expressive when handling complex data structures.

```ruby
data = [ [1, 2], { x: 10, y: 20 }, [3, 4] ]

data.each do |(a, b), { x:, y: }, *rest|
  puts "Pair: #{a},#{b}"
  puts "Hash: x=#{x}, y=#{y}"
  puts "Rest: #{rest.inspect}"
end
```