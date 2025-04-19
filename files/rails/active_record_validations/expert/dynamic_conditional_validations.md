## 🔄 Dynamic Conditional Validations
Leverage `validate` with lambdas or methods to define validations that change at runtime, based on external services or user roles. This grants maximum flexibility without polluting your model with booleans.

```ruby
# app/models/subscription.rb
class Subscription < ApplicationRecord
  validate :quota_within_limits, if: -> { plan.requires_quota_check? }

  def quota_within_limits
    unless QuotaService.new(self).within_limit?
      errors.add(:base, 'Subscription quota exceeded')
    end
  end
end
```