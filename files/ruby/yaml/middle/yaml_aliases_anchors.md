## ⚓ Work with YAML Aliases and Anchors for DRY Configs

YAML anchors (`&`) and aliases (`*`) let you avoid repetition by reusing shared mappings. Psych automatically merges aliases on load, but you can also preserve anchors on dump to generate DRY configuration files.

```ruby
require 'yaml'

yaml = <<~YAML
defaults: &defaults
  adapter: postgresql
  pool: 5

development:
  database: dev_db
  <<: *defaults

production:
  database: prod_db
  <<: *defaults
YAML

data = YAML.load(yaml)
puts data["development"]
#=> {"adapter"=>"postgresql", "pool"=>5, "database"=>"dev_db"}

# Dump back with anchors preserved
puts YAML.dump(data)
```