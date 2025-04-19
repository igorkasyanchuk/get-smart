## 🌀 Use Symbol#to_proc for Concise Enumerations
Symbol#to_proc lets you convert a symbol into a proc, trimming boilerplate when working with Enumerable methods. The `&:method` shorthand improves readability and can be marginally faster than full blocks. It’s perfect for mapping, selecting, or chaining transformations without extra syntax.

```ruby
names = ["alice", "bob", "charlie"]
upcased = names.map(&:upcase)
# => ["ALICE", "BOB", "CHARLIE"]

# Combine with select
short_names = names.select { |n| n.length < 5 }.map(&:capitalize)
# => ["Alice", "Bob"]
```