## 🛠️ Change a Column’s Data Type

If you need to alter a column’s data type, use `change_column`. Mind that some conversions may require data cleanup or a two-step migration.

```ruby
# Terminal command
generate migration ChangeCostTypeOnProducts

# db/migrate/20230105050505_change_cost_type_on_products.rb
class ChangeCostTypeOnProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :cost, :integer, using: 'cost::integer', default: 0
  end
end
```