## ➕ Merging Two Hashes
Combine two hashes into one with the `merge` method. If there are duplicate keys, you can provide a block to decide which value to keep.

```ruby
defaults = { volume: 5, brightness: 70 }
user_settings = { brightness: 90 }
overall = defaults.merge(user_settings) do |key, old_val, new_val|
  new_val  # choose user setting over default
end
puts overall  # => {:volume=>5, :brightness=>90}
```