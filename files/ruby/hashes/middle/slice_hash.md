## ✂️ Slicing a Hash to Extract a Subset

To extract only specific keys from a hash, use `slice` (Ruby 2.5+). This returns a new hash with only the given keys, ignoring any that don't exist.

```ruby
profile = { name: 'Bob', age: 30, city: 'NYC', role: 'admin' }
# Keep only name and role
basic = profile.slice(:name, :role)
# => { name: 'Bob', role: 'admin' }
```