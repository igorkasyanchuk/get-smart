## 🎯 Combine Variable‑Width Lookarounds

Ruby Oniguruma supports variable‑width lookbehind and lookahead, letting you assert complex contexts without consuming text. Chain lookarounds to enforce multi‑stage constraints.

```ruby
# Match "foo" not preceded by "bar" and not followed by digits
pattern = /(?<!bar)foo(?!\d+)/

p "barfoo".match?(pattern) # => false
p "fooA".match?(pattern)   # => true
```

Use lookarounds to validate password complexity in one shot:

```ruby
pw = "Ab1!xy"
pattern = /
  \A        # start
  (?=.*[A-Z])  # uppercase
  (?=.*[a-z])  # lowercase
  (?=.*\d)    # digit
  (?=.*\W)    # special char
  .{6,10}     # length
  \z
/x
p pw.match?(pattern)  # => true
```