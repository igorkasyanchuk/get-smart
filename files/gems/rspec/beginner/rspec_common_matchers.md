## ✅ Common Matchers

RSpec provides built‑in matchers to check values. Beginners often use `eq`, `be_truthy`, and `include`. Matchers make your specs expressive and readable.

```ruby
expect([1,2,3]).to include(2)
expect(user.active?).to be_truthy
expect(result).to eq('success')
```
