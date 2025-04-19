## 💥 Use Inline Modifiers for Contextual Flags

Instead of splitting patterns, use inline flags `(?i)`, `(?m)`, and `(?x)` scoped to subexpressions. This makes patterns more readable and avoids global side effects.

```ruby
# Case‑insensitive domain, verbose local part
pattern = /
  (?xi:       # enable IGNORECASE and EXTENDED here
    [A-Z0-9._%+-]+  # local part
    @
  )
  (?i:example\.com)  # domain only case‑insensitive
/x

p "USER.name@Example.COM".match?(pattern)  # => true
```