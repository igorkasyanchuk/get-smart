## 🐸 Trampoline Optimization to Avoid Stack Overflow

Implement a trampoline to convert recursive calls into loops, preventing deep recursion from blowing the stack. Each step returns a Proc, which the trampoline repeatedly calls until completion.

```ruby
def trampoline(f)
  loop do
    result = f.call
    return result unless result.is_a?(Proc)
    f = result
  end
end

factorial = ->(n, acc = 1) do
  if n.zero?
    acc
  else
    -> { factorial.call(n - 1, acc * n) }
  end
end

p trampoline(-> { factorial.call(10000) }) #=> huge number without stack overflow
```