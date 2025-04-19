## 📦 JSON Schema Validation for JSON Columns
Validate complex JSON structures by integrating JSON Schema with Rails. Use the `json_schemer` gem to ensure payloads stored in JSON columns adhere to a schema, giving you strict, versionable contracts.

```ruby
# app/models/event.rb
class Event < ApplicationRecord
  JSON_SCHEMA = Rails.root.join('schemas', 'event.json').read
  validate :validate_payload_schema

  def validate_payload_schema
    schemer = JSONSchemer.schema(JSON_SCHEMA)
    errors = schemer.validate(payload).to_a
    errors.each { |err| self.errors.add(:payload, err['message']) }
  end
end

# schemas/event.json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["type", "data"],
  "properties": { ... }
}
```