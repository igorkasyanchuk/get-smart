## ⚙️ Tuning Oj for Maximum Speed and Flexibility

Oj is a high-performance JSON parser and serializer for Ruby. You can configure global and per-call options to balance speed, compatibility, and format requirements. This allows handling large payloads, preserving symbol keys, and parsing custom types with minimal overhead.

```ruby
require 'oj'

# Global configuration for maximum throughput
Oj.default_options = {
  mode: :compat,         # Strict JSON compatible
  use_to_json: true,     # Respect `to_json` overrides
  symbol_keys: true,     # Deserialize keys as symbols
  time_format: :unix,    # Serialize time as integer seconds since epoch
  bigdecimal_load: :bigdecimal # Preserve precision
}

# Serialize any Ruby object
obj = { foo: 'bar', created_at: Time.now, price: BigDecimal('9.99') }
json = Oj.dump(obj)

# Deserialize back to Ruby with symbol keys and types
ruby_obj = Oj.load(json)
```