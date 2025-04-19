## 🧩 Symbol#to_proc for Concise Enumeration

You can leverage the `&:method_name` shorthand to convert symbols into Procs, making your collection operations and method chains ultra‑concise. Under the hood, `Symbol#to_proc` builds a Proc that calls the given method on each element. This idiom works seamlessly with `map`, `select`, `each`, and any method expecting a block, reducing boilerplate and improving readability.

```ruby
# Before:
names = users.map { |user| user.name.upcase }
# After:
names = users.map(&:name).map(&:upcase)

# Chaining:
identifiers = records.map(&:profile).map(&:id)
# Equivalent to:
identifiers = records.map { |r| r.profile.id }
```