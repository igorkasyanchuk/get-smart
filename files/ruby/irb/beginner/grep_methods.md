## 🎯 Filtering Methods with `grep`

If an object has too many methods, use `grep` to narrow them down by pattern. For example, to find all enumerable methods:

```ruby
irb(main):001:0> (1..5).methods.grep(/map|select/)
```

This returns only methods matching `map` or `select`, making discovery faster.