## 🚀 High-Performance Parsing and Serialization with Oj

For ultra-fast JSON processing in Ruby, the Oj gem offers C-backed parsing and dumping with customizable modes. Set default options to bias for your data patterns—such as symbolizing keys or loading BigDecimal natively—to reduce post-processing overhead.

```ruby
require 'oj'

# Global configuration
Oj.default_options = {
  mode: :compat,             # Allow interop with JSON gem structures
  symbol_keys: true,         # Convert object keys to symbols
  bigdecimal_load: :bigdecimal # Preserve BigDecimal types
}

# Parsing large JSON strings
data = Oj.load(json_string) # Fast C implementation

# Serializing objects back to JSON
json_output = Oj.dump(data, mode: :strict)
puts json_output
```