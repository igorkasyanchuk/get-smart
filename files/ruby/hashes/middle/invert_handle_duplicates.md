## ♻️ Inverting a Hash and Handling Duplicate Values

`Hash#invert` swaps keys and values but loses duplicates. To preserve all keys with the same value, you can `each_with_object` to group them into arrays.

```ruby
h = { a: 1, b: 2, c: 1 }
# Simple invert loses duplicates:
h.invert
# => { 1 => :c, 2 => :b }

# Group keys by their values:
grouped = h.each_with_object(Hash.new { |hsh, k| hsh[k] = [] }) do |(k, v), acc|
  acc[v] << k
end
# => { 1 => [:a, :c], 2 => [:b] }
```