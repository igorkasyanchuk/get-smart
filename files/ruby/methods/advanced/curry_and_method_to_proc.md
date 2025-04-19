## 🎯 Currying Methods with `Method#to_proc`
Methods aren’t just calls; they can be turned into `Proc` objects and curried for partial application. This is invaluable in functional pipelines or when building higher‑order abstractions.

```ruby
class Calculator
  def add(a, b, c)
    a + b + c
  end
end

add_proc = Calculator.new.method(:add).to_proc.curry
add_two = add_proc.call(2)
p add_two.call(3, 4) # => 9
```