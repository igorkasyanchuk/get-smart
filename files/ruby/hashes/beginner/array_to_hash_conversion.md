## 🔄 Converting Arrays to Hashes
You can transform an array of two-element arrays or a flat array into a hash using `to_h`. This is helpful when dealing with paired data lists.

```ruby
pairs = [[:x, 10], [:y, 20], [:z, 30]]
coordinates = pairs.to_h
puts coordinates  # => {:x=>10, :y=>20, :z=>30}

flat = [:a, 1, :b, 2]
hash_flat = Hash[flat]
puts hash_flat  # => {:a=>1, :b=>2}
```