## 🔗 Compose and Transform Multiple Enumerables with zip and Lazy

Use `zip` to combine enumerables element‑wise and then chain lazy operations. Destructure arrays directly in block parameters for clearer transformations.

```ruby
names  = %w[alice bob charlie]
ages   = [28, 35, 42]
cities = %w[NYC LA SF]

info = names
  .zip(ages, cities)
  .lazy
  .filter_map do |name, age, city|
    "#{name.capitalize} (#{age}) from #{city}" if age > 30
  end

p info.to_a
# => ["Bob (35) from LA", "Charlie (42) from SF"]
```