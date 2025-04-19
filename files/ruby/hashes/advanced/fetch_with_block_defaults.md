## 🎛️ `fetch` with Blocks vs Default Values

`Hash#fetch` lets you distinguish missing keys from `nil` values and lazily compute defaults. Using a block avoids creating unused defaults up‐front.

```ruby
h = {a: 1}

# Default argument (eager)
def_value = h.fetch(:b, expensive_computation)
# expensive_computation runs even if :b exists

# Block form (lazy)
lazy_value = h.fetch(:b) { expensive_computation }
# expensive_computation only runs if :b missing

# Handling nil vs missing
h[:c] = nil
h.fetch(:c, 'default')  # => nil (key exists)
h.fetch(:d, 'default')  # => "default" (key missing)
```