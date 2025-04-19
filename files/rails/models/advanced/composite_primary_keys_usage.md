## 🔗 Utilizing Composite Primary Keys

Leverage the `composite_primary_keys` gem to handle tables with multi-column primary keys in ActiveRecord. This allows models to work seamlessly with legacy schemas.

```ruby
# Gemfile
gem 'composite_primary_keys'

# app/models/subscription.rb
class Subscription < ActiveRecord::Base
  self.primary_keys = :user_id, :plan_id

  belongs_to :user
  belongs_to :plan
end

# Usage
sub = Subscription.find([42, 7])
sub.update(active: true)
```