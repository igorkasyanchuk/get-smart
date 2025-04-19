## 🔁 Convert Proc to Lambda and Vice Versa
You can wrap a Proc into a lambda to enforce arity or convert a lambda into a Proc when you need loose argument behavior. This allows you to adapt preexisting code without duplication. Use `Kernel#lambda` or `Proc#to_proc` conversion techniques.

```ruby
base_proc = Proc.new { |x, y| x * y }
lambda_from_proc = lambda(&base_proc)

puts lambda_from_proc.call(2,3)      # 6
# lambda_from_proc.call(2)          # ArgumentError

orig_lambda = ->(a){ a ** 2 }
proc_from_lambda = Proc.new(&orig_lambda)
puts proc_from_lambda.call         # 0 (nil.to_i squared)
```