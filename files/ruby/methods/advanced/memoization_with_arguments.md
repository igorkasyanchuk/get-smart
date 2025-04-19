## 💾 Memoizing Methods with Argument Caching
Standard memoization (`@var ||= ...`) fails with arguments. Use a hash keyed by args to cache method results based on its inputs, useful for expensive computations.

```ruby
class Fibonacci
  def initialize
    @cache = {}
  end

  def fib(n)
    return n if n < 2
    @cache[n] ||= fib(n - 1) + fib(n - 2)
  end
end

fib = Fibonacci.new
p fib.fib(35)  # computed once, then cached for each n
```