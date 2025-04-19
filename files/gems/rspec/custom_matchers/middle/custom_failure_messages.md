## 🚫 Enhancing Failure Messages

By customizing both positive and negative failure messages, you provide clearer test output. Use `failure_message` and `failure_message_when_negated` hooks:

```ruby
RSpec::Matchers.define :be_even do
  match do |actual|
    actual.even?
  end

  failure_message do |actual|
    "expected #{actual} to be even, but it was odd"
  end

  failure_message_when_negated do |actual|
    "expected #{actual} not to be even, but it was"
  end
end
```

Usage:

```ruby
expect(4).to be_even           # passes
expect(3).to be_even           # failure: expected 3 to be even, but it was odd
expect(4).not_to be_even       # failure: expected 4 not to be even, but it was
```