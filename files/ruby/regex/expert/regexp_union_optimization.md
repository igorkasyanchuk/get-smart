## ⚡ Optimize Large Alternations with Regexp.union

`Regexp.union` compiles multiple strings or regexes into a single optimized pattern, preventing exponential blow‑ups in alternations and improving maintainability.

```ruby
words = %w[apple banana cherry date]
pattern = Regexp.union(words)

p "I like banana pie".scan(pattern)  # => ["banana"]
```

You can mix subpatterns:

```ruby
pattern = Regexp.union(/dog/, /cat/, 'mouse')
```