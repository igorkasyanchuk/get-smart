## 🔢 Serializing and Deserializing Data with JSON

JSON is a human-readable and language-agnostic format that’s perfect for APIs and config files. Ruby’s `JSON` module makes it easy to convert Ruby hashes and arrays to JSON strings and back.

```ruby
require 'json'

# Convert Ruby hash to JSON string
data = { name: "Bob", age: 25 }
json_str = JSON.generate(data)
puts json_str  # => "{\"name\":\"Bob\",\"age\":25}"

# Parse JSON string back into a Ruby hash
parsed = JSON.parse(json_str)
puts parsed["name"]  # => "Bob"
```