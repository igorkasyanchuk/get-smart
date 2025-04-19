## 💡 Passing a Proc to a Method

You can pass a Proc as an explicit block parameter to any method that takes a block. Use the ampersand (`&`) to convert between blocks and Proc objects. This helps you extract reusable logic out of methods.

```ruby
def repeat(times, action)
  times.times(&action)
end

say_hi = Proc.new { puts "Hi!" }
repeat(3, say_hi)
# Output:
# Hi!
# Hi!
# Hi!
```