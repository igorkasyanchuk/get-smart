## 🧩 Combine Matchers with & and | Operators

When you need flexible assertions, RSpec’s composite matchers let you combine existing matchers with boolean logic. You can use `&`, `|`, and `~` (negation) to create powerful, readable expectations without custom code. This technique is ideal for validating complex object states succinctly.

```ruby
# Assert that result is positive and even
expect(result).to (be > 0) & be_even

# Assert that a string is non-empty or matches pattern
expect(user.name).to be_empty | match(/^Guest/)  

# Negation: ensure no errors are present
expect(errors).to_not contain_exactly('timeout', 'connection')
```