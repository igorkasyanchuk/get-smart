## ✅ Validate JSON with json-schema Gem
To enforce payload structure, use the `json-schema` gem for schema validation. Define a JSON Schema file and validate incoming data against it, responding with clear error messages on mismatches.

```ruby
# Gemfile
gem 'json-schema'

# Define schema in JSON
schema = {
  "type" => "object",
  "required" => ["name","age"],
  "properties" => {
    "name" => {"type" => "string"},
    "age" => {"type" => "integer","minimum" => 0}
  }
}

# Validate payload
begin
  JSON::Validator.validate!(schema, payload)
  # proceed if valid
rescue JSON::Schema::ValidationError => e
  render json: { error: e.message }, status: :unprocessable_entity
end
```

This ensures your Ruby app only processes well-formed JSON, reducing runtime errors and data inconsistencies.