## 🎯 Selecting and Rejecting Entries

To filter a hash by key or value, `select` and `reject` come in handy. They both return a new hash containing only the entries you need.

```ruby
users = { alice: 28, bob: 17, carol: 22 }
# Keep only adults
adults = users.select { |_, age| age >= 18 }
# => { alice: 28, carol: 22 }
# Remove minors
non_minors = users.reject { |_, age| age < 18 }
# => { alice: 28, carol: 22 }
```