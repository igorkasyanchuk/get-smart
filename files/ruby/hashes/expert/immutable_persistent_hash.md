## 🥶 Immutable Persistent Hash Structures

To enforce immutability and support functional updates, freeze your original hash and write a helper for non‐destructive modifications:

```ruby
class ::Hash
  def frozen_merge(other)
    dup.merge!(other).freeze
  end
end

base = { config: { retries: 3 } }.freeze
new_config = base.frozen_merge(config: { timeout: 5 })

puts base      #=> {:config=>{:retries=>3}}
puts new_config #=> {:config=>{:timeout=>5, :retries=>3}}
```

By freezing and returning a new object on each change, you can safely share state across threads or cache layers without fear of accidental mutation.