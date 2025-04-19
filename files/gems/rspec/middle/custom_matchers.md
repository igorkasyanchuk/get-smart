## 🔍 Custom Matchers

Custom matchers encapsulate complex expectations and improve test readability. Define them in `spec/support` and include via `RSpec.configure`.

```ruby
# spec/support/matchers/be_even.rb
RSpec::Matchers.define :be_even do
  match do |actual|
    actual.even?
  end
  failure_message do |actual|
    "expected #{actual} to be even"
  end
end

# spec/rails_helper.rb
RSpec.configure do |config|
  config.include RSpec::Matchers
end

# spec/models/number_spec.rb
RSpec.describe Integer do
  it "is even when divisible by 2" do
    expect(4).to be_even
  end
end
```
