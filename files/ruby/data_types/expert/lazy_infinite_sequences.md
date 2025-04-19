## ♾️ Lazy Infinite Enumerables with Enumerator::Lazy

Ruby’s lazy enumerators let you describe potentially infinite sequences without materializing them until needed. Pair them with `take`, `map`, or `select` to derive just the slice you care about.

```ruby
# Fibonacci sequence as an infinite lazy enumerator
def fib_stream
  Enumerator.new do |yielder|
    a, b = 0, 1
    loop do
      yielder << a
      a, b = b, a + b
    end
  end.lazy
end

# Compute first 10 Fibonacci numbers divisible by 3
result = fib_stream
  .select { |n| (n % 3).zero? }
  .take(10)
  .to_a

p result # => [0, 3, 21, 144, 987, ...]
```