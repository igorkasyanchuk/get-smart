## 🔍 Advanced Diffable Matcher

Create a custom, chainable matcher that supports rich diffs for nested hash or JSON comparisons. By enabling `diffable`, RSpec will show a unified diff when expectations fail, making it easy to pinpoint mismatches in large structures.

```ruby
# spec/support/matchers/match_nested_schema.rb
RSpec::Matchers.define :match_nested_schema do |expected_schema|
  match do |actual|
    @errors = compare_schema(actual, expected_schema)
    @errors.empty?
  end

  chain :ignoring_extra_keys do
    @ignore_extra = true
  end

  failure_message do |actual|
    "Expected schema to match, but found differences:\n" + @errors.join("\n")
  end

  diffable

  def compare_schema(actual, expected)
    # Recursively compare actual vs expected, collecting human-readable diffs
    []
  end
end
```

```ruby
# spec/models/user_response_spec.rb
RSpec.describe UserResponse do
  subject { JSON.parse(response_body) }

  it 'adheres to API schema' do
    expected_schema = { 'id' => Integer, 'profile' => { 'name' => String } }
    expect(subject).to match_nested_schema(expected_schema).ignoring_extra_keys
  end
end
```
