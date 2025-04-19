## 🔒 Safely Load YAML with Psych.safe_load

When consuming YAML from untrusted sources, always use `YAML.safe_load` to prevent arbitrary object deserialization and potential security risks. You can whitelist only the classes and symbols you expect, and control whether aliases and classes are permitted. This approach ensures only basic types (Array, Hash, String, etc.) or your specified classes are loaded.

```ruby
require 'yaml'
require 'date'

user_input = """
---
name: John Doe
joined_at: 2021-07-15
roles:
  - admin
"""

data = YAML.safe_load(
  user_input,
  permitted_classes: [Date],
  permitted_symbols: [],
  symbolize_names: true
)

#=> {:name=>"John Doe", :joined_at=>#<Date: 2021-07-15 ...>, :roles=>["admin"]}
```