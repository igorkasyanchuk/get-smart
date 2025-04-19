## 📄 Working with YAML for Configuration Serialization

YAML is a human-friendly data serialization format often used for configuration files. Ruby’s `YAML` module allows effortless conversion between Ruby objects and YAML text.

```ruby
require 'yaml'

# Dump Ruby object to YAML string
data = { host: "localhost", port: 3000 }
yaml_str = YAML.dump(data)
puts yaml_str
# => "---\nhost: localhost\nport: 3000\n"

# Safely load YAML back into a Ruby hash
parsed = YAML.safe_load(yaml_str)
puts parsed["port"]  # => 3000
```