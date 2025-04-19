## 🚀 Infinite Lazy Enumerators via `Enumerator.produce`

Generate potentially infinite sequences lazily with `Enumerator.produce`. This allows you to model streams (Fibonacci, counters) without recursion or manual loop constructs.

```ruby
# Fibonacci sequence
fib = Enumerator.produce([0,1]) { |(a,b)| [b, a+b] }
p fib.take(10).map(&:first)
# => [0,1,1,2,3,5,8,13,21,34]

# Exponential backoff delays
delays = Enumerator.produce(1) { |n| n * 2 }
p delays.take(5) # => [1,2,4,8,16]
```