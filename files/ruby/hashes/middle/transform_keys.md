## 🗝️ Transforming Keys with `transform_keys`

Analogous to `transform_values`, Ruby’s `Hash#transform_keys` applies a block to each key and returns a new hash. This is helpful when you need to normalize key formats (e.g., string → symbol).

```ruby
params = { 'user_id' => 1, 'user_name' => 'Alice' }
# Convert string keys to symbols
symbolized = params.transform_keys { |k| k.to_sym }
# => { :user_id => 1, :user_name => 'Alice' }
```