## 🧵 Stateful Fiber-Based Enumerators for External Iteration Control

`Enumerator.new` uses an internal fiber to yield values, giving you manual control of state and backpressure. This is perfect for complex generators where you want to pause, resume, or interleave multiple streams.

```ruby
fib = Enumerator.new do |yielder|
  a, b = 0, 1
  loop do
    yielder << a         # yield current value
    a, b = b, a + b      # update state
  end
end

# External iteration
10.times { puts fib.next }
# => 0 1 1 2 3 5 8 13 21 34
```