## 👀 Employ Lookahead and Lookbehind Assertions
Lookaround lets you assert context without consuming characters. Use `(?=…)` and `(?!…)` for lookahead, `(?<=…)` and `(?<!…)` for lookbehind.

```ruby
# Match 'foo' only if followed by 'bar'
'foobar'.scan(/foo(?=bar)/)  # => ["foo"]
# Match digits only if preceded by a dollar sign
'$100 and 200'.scan(/(?<=\$)\d+/) # => ["100"]
```

Lookaround is perfect for validating or extracting data based on context.