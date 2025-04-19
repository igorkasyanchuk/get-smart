## 🛠️ Parse JSON Strings into Ruby Objects
Parsing JSON data is straightforward with Ruby’s built-in `json` library. First, require the library and then call `JSON.parse` on a JSON-formatted string to convert it into native Ruby types (hashes, arrays, strings, etc.).

```ruby
require 'json'

json_str = '{"name":"Alice","age":30,"skills":["Ruby","JSON"]}'
parsed = JSON.parse(json_str)
puts parsed.class            # => Hash
puts parsed["name"]         # => "Alice"
puts parsed["skills"][1]    # => "JSON"
```

You can pass the `symbolize_names: true` option to `JSON.parse` to convert keys to symbols for more idiomatic Ruby usage:

```ruby
parsed_sym = JSON.parse(json_str, symbolize_names: true)
puts parsed_sym[:age]         # => 30
```