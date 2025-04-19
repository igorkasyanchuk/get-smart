## ⚠️ Execute Code Strings with `eval` (Use with Caution)

Ruby’s `eval` can run any string as code, enabling powerful on-the-fly logic. However, it poses security risks and can obscure errors, so reserve it for controlled scenarios (e.g., trusted scripts).

```ruby
code = '2 + 3 * 4'
result = eval(code)
puts result   # => 14
```