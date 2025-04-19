## 🎯 Advanced Pattern Matching with Symbol Keys

Ruby 2.7+ introduces structural pattern matching, with symbols frequently serving as hash keys in deconstructable data. Use concise `case in` expressions to match nested hashes and arrays, extracting values into local variables with minimal ceremony.

```ruby
response = { status: :ok, data: { id: 42, name: "Alice" } }

case response
in { status: :ok, data: { id:, name: } }
  puts "User ##{id}: #{name}"
in { status: :error, error: message }
  warn "Error: #{message}"
end
```

You can also match array payloads with symbol constants:

```ruby
message = [:update, :cache, { key: "user:1", value: user_data }]

case message
in [:update, :cache, { key:, value: }]
  update_cache(key, value)
end
```