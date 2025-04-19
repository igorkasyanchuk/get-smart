## 🔒 Advanced Safe Loading with Custom Whitelists

Ruby’s `YAML.load` can introduce security risks by instantiating arbitrary objects. Use `Psych.safe_load` with explicit `permitted_classes`, `permitted_symbols`, and alias support to whitelist only trusted constructs. After loading, deep‑freeze the resulting structure to prevent post‑load modifications and enforce immutability.

```ruby
require 'yaml'
require 'date'

options = {
  permitted_classes: [Date, Time],
  permitted_symbols: [:enabled, :threshold],
  aliases: true
}

data = YAML.safe_load(File.read('config.yaml'), **options)

def deep_freeze(obj)
  case obj
  when Hash
    obj.each_value { |v| deep_freeze(v) }
    obj.freeze
  when Array
    obj.each { |v| deep_freeze(v) }
    obj.freeze
  else
    obj.freeze
  end
end

deep_freeze(data)
puts data.inspect
```