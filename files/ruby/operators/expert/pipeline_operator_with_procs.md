## 🔮 Building a Pipeline Operator with `Proc#>>`

Compose `Proc` objects into pipelines using a custom `>>` operator. This functional style boosts readability and testability of chained transformations.

```ruby
class Proc
  def >>(other)
    proc { |*args| other.call(self.call(*args)) }
  end
end

incr    = ->(x) { x + 1 }
double  = ->(x) { x * 2 }
pipeline = incr >> double >> incr

puts pipeline.call(3)  # ⇒ 9  (3+1=4 *2=8 +1=9)
```