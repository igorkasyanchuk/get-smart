## 🔍 Leveraging Arel for Complex Queries

When ActiveRecord scopes hit complexity limits, use Arel to build composable SQL expressions while still benefiting from parameterization and injection safety. Arel nodes can represent tables, columns, and SQL operators.

```ruby
class User < ApplicationRecord
  def self.with_balance_and_recent_login(min_balance, days)
    users = arel_table
    login = Login.arel_table

    join_condition = users[:id].eq(login[:user_id])
    min_balance_condition = users[:balance].gteq(min_balance)
    recent_login_condition = login[:created_at].gt(days.days.ago)

    joins(users.join(login).on(join_condition).join_sources)
      .where(min_balance_condition.and(recent_login_condition))
  end
end

# Usage
def expensive_active_users
  User.with_balance_and_recent_login(1000, 7)
end
```
