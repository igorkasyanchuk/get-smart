## 🔄 Parse Nested Structures with Recursive Patterns

Oniguruma supports recursive subroutine calls to match arbitrarily nested constructs—ideal for parenthesis, XML tags, or quotes. Define a named subpattern that calls itself with `(?&name)` inside.

```ruby
nested = /
  \(
    (?:
      [^()]+      # any non-paren chunk
      | (?&nested)  # recursive call
    )*
  \)
/x

p "((a(b)c)d)".match?(nested)  # => true
```

You can adapt `nested` to match HTML-like tags or other paired delimiters by adjusting the outer delimiters.