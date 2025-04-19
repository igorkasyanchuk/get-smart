## 📂 Read and Write JSON Files
Combining Ruby’s `File` class with `json` makes it easy to persist data or load configurations. To read a JSON file, use `File.read` and `JSON.parse`. To write, use `File.write` along with `JSON.pretty_generate` for human-friendly formatting.

```ruby
require 'json'

# Writing to a file
data = { settings: { theme: "dark", notifications: true } }
File.write("config.json", JSON.pretty_generate(data))

# Reading from a file
json_text = File.read("config.json")
config = JSON.parse(json_text)
puts config["settings"]["theme"]  # => "dark"
```

Using `pretty_generate` adds newlines and indentation, making the JSON file easy to read and edit by hand.