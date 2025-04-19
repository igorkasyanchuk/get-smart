## 📤 Dumping Ruby Objects to YAML

Ruby objects like Hashes, Arrays, and Strings can be serialized to YAML with `to_yaml`. This is useful for saving structured data to a file in a human‑readable format. Simply call `to_yaml` on your object and write the result to disk or output it to the console.

```ruby
require 'yaml'

# Create a Ruby Hash containing application settings
data = {
  'app' => {
    'name'    => 'MyApp',
    'version' => '1.0.0',
    'features' => ['login', 'reports', 'api']
  }
}

# Convert to YAML and save to a file
File.write('settings.yml', data.to_yaml)
```