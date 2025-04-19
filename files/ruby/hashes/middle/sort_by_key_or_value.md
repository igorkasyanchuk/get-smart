## 🔢 Sorting Hashes by Keys or Values

While hashes are now ordered by insertion, you can sort them temporarily. `sort_by` returns an array of key-value pairs which you can re-convert to a hash.

```ruby
scores = { alice: 50, bob: 70, carol: 60 }
# Sort by score (value)
sorted_by_value = scores.sort_by { |_, v| v }.to_h
# => { alice: 50, carol: 60, bob: 70 }

# Sort by name (key)
sorted_by_key = scores.sort_by { |k, _| k.to_s }.to_h
# => { alice: 50, bob: 70, carol: 60 }
```