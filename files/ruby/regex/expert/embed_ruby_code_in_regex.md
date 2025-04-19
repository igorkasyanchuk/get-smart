## 🛠️ Embed Ruby Logic with Code Extensions

Oniguruma in Ruby allows embedding Ruby snippets inside a pattern with `(?{ ... })` and dynamic fragments via `(??{ ... })`. This lets you build contexts or decisions at match time.

```ruby
counter = 0
regex = /
  (\w+)(?{ counter += 1 })  # increment for each match
/x

"a b c".scan(regex)
p counter  # => 3
```

Dynamic pattern generation:

```ruby
words = %w[foo bar]
regex = /(??{ Regexp.union(words) })baz/
p "foobaz".match?(regex)  # => true
```