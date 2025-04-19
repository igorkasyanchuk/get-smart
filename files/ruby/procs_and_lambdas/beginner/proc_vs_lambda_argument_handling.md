## 🎯 Proc vs Lambda: Argument Handling

Procs are lenient with arguments (extra ones are ignored, missing ones are `nil`), while lambdas enforce the exact number of parameters. Choose lambdas when you want strict checks and procs when you need flexibility.

```ruby
flexible = Proc.new { |a, b| puts "a=#{a}, b=#{b}" }
strict   = ->(a, b) { puts "a=#{a}, b=#{b}" }

flexible.call(1)    # => a=1, b=
# strict.call(1)    # ArgumentError: wrong number of arguments (given 1, expected 2)
```