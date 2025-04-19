## 🎯 Parameterized Range Matcher

Custom matchers can accept arguments to make them reusable and descriptive. Here’s how to define a matcher that checks if a number falls within a given range:

```ruby
RSpec::Matchers.define :be_within_range do |min, max|
  match do |actual|
    actual >= min && actual <= max
  end

  description do
    "be within the range #{min} to #{max}"
  end

  failure_message do |actual|
    "expected #{actual} to be between #{min} and #{max}"
  end

  failure_message_when_negated do |actual|
    "expected #{actual} not to be between #{min} and #{max}"
  end
end
```

Usage:

```ruby
expect(5).to be_within_range(1, 10)
expect(15).not_to be_within_range(1, 10)
```