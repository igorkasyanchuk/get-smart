## 🔍 Keyword Argument Forwarding with `...`

Use the triple-dot `...` to perfectly forward all arguments (positional, keyword, and block) to another method. This is essential in wrapper or middleware patterns to avoid signature mismatch.

```ruby
def log_and_call(name:, **attrs, &block)
  puts "Calling #{name} with #{attrs.inspect}"
  perform(name: name, **attrs, &block)
end

# Or fully forward including positional args:
def wrapper(*, **, &)
  puts "Entering wrapper"
  call_service(...)
end
```