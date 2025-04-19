## 🔄 Build a Custom Infinite Enumerator with Ranges
Combine endless ranges with custom step logic to create powerful, infinite streams, such as for retry backoff or sequence generators. By feeding an endless range into `flat_map` or `map` you can yield complex sequences lazily without storing state.

```ruby
# Fibonacci stream using endless Range
fib = Enumerator.new do |yielder|
  a, b = [0, 1]
  (1..).each do
    yielder << a
    a, b = b, a + b
  end
end

puts fib.take(10).inspect  # [0,1,1,2,3,5,8,13,21,34]

# Exponential backoff delays
backoff = (0..).lazy.map { |i| 2**i }.take(5).force
# => [1,2,4,8,16]
```