## 🧹 Compacting a Hash to Remove Nil Values

To clean up a hash by removing entries whose values are `nil`, use `compact` (Ruby 2.4+). This returns a new hash without the unwanted keys.

```ruby
data = { name: 'Eve', age: nil, city: 'LA', email: nil }
clean = data.compact
# => { name: 'Eve', city: 'LA' }
```