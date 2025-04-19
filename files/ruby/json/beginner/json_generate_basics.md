## ✍️ Generate JSON from Ruby Objects
Ruby objects like Hashes and Arrays provide a `to_json` method (after requiring `json`) to serialize them into JSON strings. This is useful when you need to send data over HTTP or store it in a JSON file.

```ruby
require 'json'

user = { name: "Bob", active: true, roles: ["admin", "editor"] }
json_output = user.to_json
puts json_output  # => "{\"name\":\"Bob\",\"active\":true,\"roles\":[\"admin\",\"editor\"]}"
```

Alternatively, use `JSON.generate` for the same result:

```ruby
json_output2 = JSON.generate(user)
puts json_output2 == json_output  # => true
```