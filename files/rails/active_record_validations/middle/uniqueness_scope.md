## 🔍 Uniqueness Validation with Scope
Enforce uniqueness within a subset of records by using the `scope` option. Combine it with `case_sensitive` to tailor comparisons for strings.

```ruby
class Subscription < ApplicationRecord
  validates :email, uniqueness: { scope: :plan_id, case_sensitive: false,
                                  message: "has already subscribed to this plan" }
end
```
