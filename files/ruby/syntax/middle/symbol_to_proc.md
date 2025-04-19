## 📌 Converting Symbols to Procs

The `&:symbol` shorthand converts a symbol into a `Proc`, making method calls in enumerables more readable. It's perfect for simple one‑method blocks.

```ruby
names = ["alice", "bob", "carol"]

# Traditional block:
upcased = names.map { |n| n.upcase }

# Symbol to proc:
upcased = names.map(&:upcase)
# => ["ALICE", "BOB", "CAROL"]
```