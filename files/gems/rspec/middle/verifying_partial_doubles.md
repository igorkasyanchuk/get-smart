## 🔒 Verifying Partial Doubles

Enable verifying partial doubles to ensure stubbed or mocked methods actually exist on the real object. This catches tests that drift from the implementation.

```ruby
# spec/rails_helper.rb
RSpec.configure do |config|
  config.verify_partial_doubles = true
end

# spec/models/user_spec.rb
RSpec.describe User do
  it "stubs an existing method" do
    allow(subject).to receive(:valid?).and_return(true)
    expect(subject.valid?).to be_truthy
  end

  it "raises when stubbing a non-existent method" do
    expect {
      allow(subject).to receive(:nonexistent)
    }.to raise_error(RSpec::Mocks::MockExpectationError)
  end
end
```
