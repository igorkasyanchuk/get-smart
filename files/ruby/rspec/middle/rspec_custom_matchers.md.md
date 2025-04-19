## 🛠️ Writing Custom Matchers for Readability

Custom matchers encapsulate complex assertions into human-readable DSLs, improving spec clarity and error messages. Define them in `spec/support/matchers` and register in `rails_helper.rb`. This approach decouples expectation logic from tests, making intent explicit.

```ruby
# spec/support/matchers/have_valid_factory.rb
RSpec::Matchers.define :have_valid_factory do |factory|
  match do |_|
    build(factory).valid?
  end
  failure_message do |actual|
    "expected #{factory} to be valid, got errors: "+ build(factory).errors.full_messages.join(', ')
  end
end

# Usage
describe User, type: :model do
  it { is_expected.to have_valid_factory(:user) }
end
```