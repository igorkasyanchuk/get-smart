## 🛠️ Advanced Chaining and Dynamic Parameters

Custom matchers can expose richly chainable interfaces to express complex assertions cleanly. By using `chain`, `match`, and dynamic arguments, you can tailor matchers for different contexts without repetition. This approach is ideal for verifying flexible data structures or multi-step transformations while keeping your specs concise.

```ruby
# spec/support/matchers/validate_json_schema.rb
RSpec::Matchers.define :match_json_schema do |schema_name|
  match do |actual_json|
    schema = JSON::SchemaLoader.load("spec/schemas/#{schema_name}.json")
    JSON::Validator.validate!(schema, actual_json)
    true
  rescue JSON::Schema::ValidationError
    false
  end

  chain :with_error_message do |expected_message|
    @expected_message = expected_message
  end

  match_when_negated do |actual_json|
    JSON::Validator.validate!(JSON::SchemaLoader.load("spec/schemas/#{schema_name}.json"), actual_json)
    false
  rescue JSON::Schema::ValidationError => e
    e.message.include?(@expected_message)
  end

  failure_message do |actual_json|
    "expected JSON to match '#{schema_name}' schema but it failed: #{JSON::Validator.fully_validate(JSON::SchemaLoader.load("spec/schemas/#{schema_name}.json"), actual_json).join(", ")}"
  end
end

# Usage in a spec:
expect(response.body).to match_json_schema(:user_profile).with_error_message("required property 'id'")
```