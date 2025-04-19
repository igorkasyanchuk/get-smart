## 🛠️ Efficient Stateful Accumulation with each_with_object

`each_with_object` carries a mutable object through an iteration, perfect for building hashes, arrays, or nested data structures without external state variables.

```ruby
# Group odd numbers by modulo 5
numbers = (1..20).lazy.select(&:odd?)
grouped = numbers.each_with_object(Hash.new { |h, k| h[k] = [] }) do |n, h|
  h[n % 5] << n
end

p grouped
# => {1=>[1, 6, 11, 16], 3=>[3, 8, 13, 18], 0=>[5, 10, 15, 20], 2=>[2, 7, 12, 17], 4=>[4, 9, 14, 19]}
```