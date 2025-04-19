## 🔢 Understand Lambda vs Proc Arity
Lambdas enforce the exact number of arguments, while Procs are more forgiving. Knowing this distinction helps prevent subtle bugs when you expect strict argument checking. Use lambdas for predictable signatures and procs when flexibility is desired.

```ruby
strict = ->(a, b) { a + b }
loose  = Proc.new { |a, b| a.to_i + b.to_i }

puts strict.call(1, 2)        # 3
# strict.call(1)              # ArgumentError: wrong number of arguments
puts loose.call(1)            # 1
puts loose.call(1,2,3,4)      # 3 (extra args ignored)
```