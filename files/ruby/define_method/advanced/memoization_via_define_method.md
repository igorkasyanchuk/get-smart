## ⚡ Memoization Patterns via define_method

Leverage `define_method` to DRY memoization logic across multiple expensive computations. By using a loop and `define_method`, you avoid repeating caching boilerplate.

```ruby
class ExpensiveCalculator
  [:fib, :factorial, :prime_factors].each do |meth|
    define_method(meth) do |n|
      cache_var = "@_cache_#{meth}".to_sym
      @_memo ||= {}
      @_memo[n] ||= begin
        puts "Computing #{meth}(#{n})..."
        send("compute_#{meth}", n)
      end
    end
  end

  private

  def compute_fib(n)
    return n if n < 2
    fib(n-1) + fib(n-2)
  end

  def compute_factorial(n)
    (1..n).inject(:*) || 1
  end

  def compute_prime_factors(n)
    (2..n).select { |i| n % i == 0 }
  end
end

calc = ExpensiveCalculator.new
calc.fib(10)       # Computes once, caches for future calls
calc.fib(10)       # Instant result from cache
```