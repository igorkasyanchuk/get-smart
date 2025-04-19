## 🗄️ Customize JSON Serialization Behavior

ActiveSupport::JSON handles encoding of core Ruby types, but you can tweak how special cases are serialized. For instance, encode `BigDecimal` as strings to preserve precision in JavaScript clients. You can also define custom encode/decode for your own classes.

```ruby
# In an initializer (e.g., config/initializers/json_encoding.rb)
ActiveSupport::JSON::Encoding.encode_big_decimal_as_string = true

# Custom encoder for a domain object
ActiveSupport::JSON::Encoding.json_encoder.define_singleton_method(:encode) do |value|
  if value.is_a?(Money)
    { amount: value.cents, currency: value.currency.iso_code }.to_json
  else
    super(value)
  end
end
```
