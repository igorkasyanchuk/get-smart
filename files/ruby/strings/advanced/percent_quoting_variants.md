## 🧵 Master %q, %Q, and Custom Delimiters

Use `%q` for single-quoted literal strings (no interpolation) and `%Q` for double-quoted behavior. Pick delimiters to avoid backslashes and improve readability when nesting quotes.

```ruby
# single-quoted style
pattern = %q{^/api/v1/.*$}
# double-quoted style
template = %Q!Hello, #{user_name}!  # cleaner than quotes

# custom delimiter for JSON in Ruby
json = %Q|{