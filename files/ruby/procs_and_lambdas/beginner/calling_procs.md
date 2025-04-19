## 🔄 Calling Procs with Different Syntaxes

Procs accept multiple call syntaxes: `call`, `[]`, or `yield`-style with `&`. Familiarize yourself with these to make your code more readable and idiomatic.

```ruby
p = proc { |x| x * 2 }

puts p.call(5)   # => 10
puts p[5]        # => 10
# Using as a block
[1,2,3].map(&p)  # => [2, 4, 6]
```