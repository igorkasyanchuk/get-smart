## 🎯 Create a Parameterized Matcher
Sometimes you need matchers that accept arguments to be more flexible. Pass parameters to your matcher definition so you can reuse it with different values.

```ruby
# spec/support/matchers/be_within_range.rb
RSpec::Matchers.define :be_within_range do |min, max|
  match do |actual|
    actual >= min && actual <= max
  end
end
```

Use it like this:

```ruby
expect(5).to be_within_range(1, 10)
expect(15).not_to be_within_range(1, 10)
```