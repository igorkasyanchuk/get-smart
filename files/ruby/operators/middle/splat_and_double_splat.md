## ✂️ Splat and Double Splat Operators
The single (`*`) and double (`**`) splat operators expand arrays and hashes into argument lists. They simplify method signatures and dynamic calls.

```ruby
def sum(a, b, c)
  a + b + c
end

a = [1, 2, 3]
sum(*a) # => 6

# Double splat for keyword args
def options_demo(x:, y:)
  [x, y]
end

h = { x: 10, y: 20 }
options_demo(**h) # => [10, 20]
```