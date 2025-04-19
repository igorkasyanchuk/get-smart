## 🛠️ Custom Matcher with Chainable Methods

RSpec’s custom matchers let you encapsulate complex comparison logic and share it across examples. By defining chainable methods, you can build versatile matchers that adjust behavior based on chained parameters. This pattern keeps specs readable and DRY when you need nuanced assertions.

```ruby
# spec/support/matchers/validate_json_schema.rb
RSpec::Matchers.define :validate_json_schema do |schema|
  match do |json|
    JSON::Validator.valid?(schema, json)
  end
  chain :with_errors do |errors|
    @expected_errors = errors
  end
  failure_message do |json|
    "expected \\#{json} to match \\#{schema}, got errors: \\#{@expected_errors.inspect}"
  end
end

# Usage in spec
expect(response.body).to validate_json_schema('user_schema.json').with_errors(['id is missing'])
```