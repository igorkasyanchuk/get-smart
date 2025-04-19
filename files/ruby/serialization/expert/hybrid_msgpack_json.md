## 🔄 Hybrid MessagePack & JSON Schema Fallback for Reliable Data Exchange

In distributed systems, binary formats like MessagePack are ideal for speed, but sometimes you need human-readable fallbacks. Implement a wrapper that tries MessagePack, and if validation against a JSON Schema fails, re-serialize to JSON. This guarantees both performance and debuggability.

```ruby
require 'msgpack'
require 'json-schema'

SCHEMA = {
  "type" => "object",
  "required" => ["id","payload"],
  "properties" => {
    "id" => { "type" => "string" },
    "payload" => { "type" => "object" }
  }
}

def serialize(data)
  bin = data.to_msgpack
  begin
    JSON::Validator.validate!(SCHEMA, MessagePack.unpack(bin))
    { format: :msgpack, data: bin }
  rescue JSON::Schema::ValidationError
    { format: :json, data: data.to_json }
  end
end

# Usage
packet = { id: "123", payload: { foo: :bar } }
result = serialize(packet)
# result[:format] == :msgpack or :json
```