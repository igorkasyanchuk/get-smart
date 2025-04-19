## 🔁 Deep Transform Nested Hashes

ActiveSupport extends Hash with methods like `deep_transform_keys`, `deep_transform_values`, and `deep_merge` for working with nested structures. This is invaluable when processing API payloads or converting data formats in bulk. These methods preserve the original overriding behavior or transform keys/values recursively.

```ruby
payload = { 'user' => { 'first_name' => 'Alice', 'metadata' => { 'age' => '30' } } }
# Convert all keys to symbols and parse numeric strings
symbolized = payload.deep_transform_keys(&:to_sym)
converted = symbolized.deep_transform_values do |v|
  v =~ /^\d+$/ ? v.to_i : v
end
# Merge nested defaults
defaults = { user: { metadata: { active: true } } }
result = defaults.deep_merge(converted)
```
