## 🔁 Trampoline Pattern with Procs
The trampoline pattern transforms deep recursive calls into an iterative loop, preventing stack overflows for large input sizes. You return a Proc when recursion should continue and a final value otherwise, and a runner repeatedly invokes returned Procs until a non‑Proc is produced.

```ruby
def trampoline(proc, *args)
  result = proc.call(*args)
  while result.is_a?(Proc)
    result = result.call
  end
  result
end

fact = ->(n, acc = 1) {
  n.zero? ? acc : -> { fact.call(n - 1, n * acc) }
}

# Compute factorial of 10000 without blowing the stack
enormous = trampoline(fact, 10000)
puts enormous.to_s.size # prints number of digits
```