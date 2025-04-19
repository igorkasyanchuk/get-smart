## 🗝️ Symbols vs. Strings
Symbols are lightweight, immutable identifiers often used as hash keys. Unlike strings, the same symbol object is reused, saving memory and improving performance. Use symbols for keys and constants that don’t need string methods.

```ruby
status = :active
options = { verbose: true, format: :json }
puts options[:format]  # => :json
```