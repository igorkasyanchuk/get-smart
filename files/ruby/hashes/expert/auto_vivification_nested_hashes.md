## 🐣 Auto‑Vivification of Nested Hashes

In languages like Perl, nested hash creation is automatic. You can mimic that in Ruby by setting a default proc on the root hash that generates deeper levels on‐the‐fly.

```ruby
auto_hash = Hash.new do |h, key|
  h[key] = Hash.new(&h.default_proc)
end

auto_hash[:users][:alice][:visits] = 1
puts auto_hash
#=> { users: { alice: { visits: 1 } } }
```

This technique avoids manual checks (`h[:a] ||= {}`) and elegantly supports arbitrarily deep structures, perfect for accumulating stats or building dynamic trees at runtime.