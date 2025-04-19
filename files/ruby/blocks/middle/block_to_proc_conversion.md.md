## 🔗 Convert Blocks to `Proc` Objects with `&block`

Sometimes you need to store or pass a block around as a `Proc`. Prefixing a method parameter with `&` automatically converts the incoming block to a `Proc`. You can then call, pass, or combine it with other procs seamlessly.

```ruby
def repeat(n, &block)
  n.times { block.call }
end

say_hi = proc { puts 'Hi!' }
repeat(3, &say_hi)
# Outputs:
# Hi!
# Hi!
# Hi!
```