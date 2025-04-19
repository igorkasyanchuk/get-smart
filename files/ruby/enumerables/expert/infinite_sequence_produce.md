## 🔄 Generating Infinite Sequences with Enumerator.produce

`Enumerator.produce` (Ruby 2.7+) simplifies creation of infinite, stateful sequences without explicit fibers. Define a seed value and a block that returns the next state tuple. Combining with lazy methods you can slice, map, or zip infinite streams on demand.

```ruby
# Fibonacci generator: returns [current, next] pair
fib = Enumerator.produce([0, 1]) { |(a, b)| [b, a + b] }
      .map(&:first)          # extract the first element of each state

p fib.take(10)            # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```