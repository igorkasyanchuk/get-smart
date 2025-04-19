## 🛡️ Safely Parsing YAML Strings

When parsing YAML from external sources, untrusted data can lead to security risks. Using `YAML.safe_load` helps prevent arbitrary object deserialization by limiting loaded types to simple primitives. You can then work with the resulting Hash just like any other Ruby data structure.

```ruby
require 'yaml'

yaml_str = <<~YAML
  user:
    name: Alice
    admin: true
YAML

# Safely load the YAML string into a Ruby Hash
parsed = YAML.safe_load(yaml_str)

puts "User: #{parsed['user']['name']} (Admin: #{parsed['user']['admin']})"
```