## 🏗 Complex Chains with Safe Navigation and `yield_self`

Combine safe navigation (`&.`) with `yield_self` to elegantly guard and transform nested data structures without verbose nil checks.

```ruby
user = fetch_user()  # may return nil

greeting = user&.profile&.settings&.theme&.yield_self do |theme|
  theme == 'dark' ? '🌙 Dark Mode Active' : '☀️ Light Mode'
end

puts greeting || '👤 Guest Mode'
```