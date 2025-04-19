## 🔧 Enforce Check Constraints

Since Rails 6, you can define database-level check constraints to enforce data integrity. Use `add_check_constraint` to ensure values meet conditions. This prevents invalid data at the database layer and simplifies model validations.

```ruby
class AddPriceCheckConstraintToProducts < ActiveRecord::Migration[6.1]
  def change
    add_check_constraint :products, 'price >= 0', name: 'price_non_negative'
  end
end
```