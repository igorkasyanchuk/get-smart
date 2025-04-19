## 🌀 Replacing `alias_method_chain` with `Module#prepend`

Rails’ `alias_method_chain` is deprecated—use `prepend` for elegant method wrapping. You preserve `super` chains and avoid hidden aliases.

```ruby
module CacheFetch
  def fetch(key)
    Rails.cache.read(key) || super
  end
end

class DataStore
  prepend CacheFetch

  def fetch(key)
    # expensive lookup...
    "value"
  end
end

DataStore.new.fetch(:foo) # attempts cache, then falls back
```

By using `prepend`, you keep the method chain intuitive and reversible.