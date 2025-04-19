## ➰ Converting Blocks with & to Proc
You can convert a block into a `Proc` object by prefixing a symbol or proc with `&`. This is handy for passing around reusable logic.

```ruby
def apply_twice(proc_obj)
  proc_obj.call
  proc_obj.call
end

dbl = Proc.new { puts "Hello twice!" }
apply_twice(&dbl)
# Output:
# Hello twice!
# Hello twice!
```