## ⚡ Prevent Backtracking with Atomic Groups
Wrap subpatterns in atomic groups `(?>...)` to forbid backtracking into them, eliminating catastrophic backtracking in complex patterns. This ensures once the engine leaves an atomic group, it won't revisit it, boosting performance.

```ruby
str = 'a' * 30 + '!'
# Vulnerable to backtracking
regexp1 = /(a+)+!/
# Optimized with atomic group
regexp2 = /(?>a+)+!/
# regexp1.match(str) might be slow; regexp2.match(str) is instant
```