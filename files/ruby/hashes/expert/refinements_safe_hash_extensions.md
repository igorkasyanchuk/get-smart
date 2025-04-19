## 🛡️ Refinements for Safe Hash Extensions

Monkey‐patching core classes can cause conflicts in large apps or gems. Ruby refinements provide localized patches:

```ruby
module HashSliceRefinement
  refine ::Hash do
    def slice(*keys)
      keys.each_with_object({}) { |k, acc| acc[k] = self[k] if key?(k) }
    end
  end
end

using HashSliceRefinement
settings = { a: 1, b: 2, c: 3 }
slice = settings.slice(:a, :c)
#=> {:a=>1, :c=>3}

# Outside the `using` scope, `Hash#slice` remains untouched in other modules/gems.
```

Refinements keep your patch contained, ensuring downstream gems aren’t surprised by your custom helpers.