## ✅ Enforcing Database-level Constraints with Migrations

Add database check constraints to enforce invariants and keep your data consistent even if validations are skipped. Use `add_check_constraint` in migrations and mirror them in model validations.

```ruby
# db/migrate/XXXX_add_positive_balance_constraint.rb
class AddPositiveBalanceConstraint < ActiveRecord::Migration[6.1]
  def change
    add_check_constraint :accounts, 'balance >= 0', name: 'balance_non_negative'
  end
end

# app/models/account.rb
class Account < ApplicationRecord
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
```