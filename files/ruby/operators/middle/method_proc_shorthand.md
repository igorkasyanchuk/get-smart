## 📣 Method Proc Shorthand
The `&:method_name` shorthand converts a symbol to a proc, making collections transformations succinct. It's especially useful with `map`, `select`, and similar iterators.

```ruby
names = ['alice', 'bob', 'carol']
# Expand each string to uppercase
names.map(&:upcase) # => ["ALICE", "BOB", "CAROL"]

# Check presence of key in hashes
users = [{active: true}, {active: false}]
users.select(&:_fetch) # not typical, but illustrates conversion
```