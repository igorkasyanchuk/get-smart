## ⚙️ Building Custom Methods with yield
You can define your own methods that accept blocks by using `yield`. Inside the method, `yield` transfers control to the block you pass in.

```ruby
def greet
  puts "Before greeting"
  yield if block_given?
  puts "After greeting"
end

greet do
  puts "Hello from the block!"
end
# Output:
# Before greeting
# Hello from the block!
# After greeting
```