## 📥 Loading YAML Files

Using YAML.load_file is the simplest way to read YAML data into Ruby as a native Hash. Always require `yaml` at the top of your script to access the loader methods. Once loaded, you can access nested keys just like a normal Hash, which makes configuration management easy.

```ruby
require 'yaml'

# Load a YAML file into a Ruby Hash
db_config = YAML.load_file('config/database.yml')

# Access nested values
host = db_config['production']['host']
puts "Database host: #{host}"
```