## 🔗 Creating Chainable Custom Matchers

Chainable matchers let you build flexible expectations by adding extra qualifiers. You can define multiple `chain` blocks inside `RSpec::Matchers.define` to accept additional parameters and accumulate state before evaluating the final `match` block.

```ruby
# spec/support/matchers/be_json_response.rb
RSpec::Matchers.define :be_json_response do
  match do |response|
    valid_json?(response.body) && status_ok?
  end

  chain(:with_status) do |expected_status|
    @expected_status = expected_status
  end

  chain(:including) do |key|
    @required_key = key
  end

  def valid_json?(body)
    JSON.parse(body)
    true
  rescue JSON::ParserError
    false
  end

  def status_ok?
    return response.status == @expected_status if defined?(@expected_status)
    response.status == 200
  end

  def matches_including_key?
    @required_key.nil? || JSON.parse(response.body).key?(@required_key)
  end

  match do |response|
    valid_json?(response.body) && status_ok? && matches_including_key?
  end
end
```

Usage:

```ruby
expect(response).to be_json_response.with_status(201).including('id')
```