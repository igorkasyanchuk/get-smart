## 🔄 Yielding to Blocks
Methods can accept blocks, allowing you to pass chunks of code. Use `yield` inside the method to invoke the block, making your method more flexible.

```ruby
def repeat(times)
  times.times { yield }
end

repeat(3) { puts "Hello!" }
# Output:
# Hello!
# Hello!
# Hello!
```