## 🔍 Use Lookaround Assertions
Use positive/negative lookahead `(?=...)`, negative lookahead `(?!...)`, and lookbehind `(?<=...)`/`(?<!...)` to match context without consuming characters. This is invaluable for validations and context-aware replacements without extra capturing groups.

```ruby
text = 'foo123bar'
# Match digits only when preceded by letters and followed by letters
digits = text.scan(/(?<=[A-Za-z])\d+(?=[A-Za-z])/)
#=> ["123"]
```