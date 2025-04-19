## 🔍 Ensure Verifying Partial Doubles

Verifying partial doubles enforce that stubbed or expected methods actually exist on real objects. This prevents false-positive tests due to typos or API changes. Enable this globally or selectively to tighten your test suite’s accuracy.

```ruby
# spec/spec_helper.rb
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

# Example of enforcement
allow(user).to receive(:full_nam)  # raises NameError: `full_nam` does not exist
allow(user).to receive(:full_name)  # passes
```