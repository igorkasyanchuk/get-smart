## 🧩 Partial Application with Procs
Implement partial application by pre-binding arguments to a `Proc`, yielding a new callable with remaining parameters. This is ideal for configuring callbacks or pipelines with fixed context values.

```ruby
def partial(proc, *preset)
  ->(*more) { proc.call(*preset, *more) }
end

sum = ->(a, b, c) { a + b + c }
add_five = partial(sum, 2, 3)
puts add_five.call(4) # => 9
```