## 🔄 Rename a Column Safely

To change a column’s name without data loss, use `rename_column`. This keeps your schema intact and is reversible by default.

```ruby
# Terminal command
generate migration RenamePriceToCostInProducts

# db/migrate/20230104040404_rename_price_to_cost_in_products.rb
class RenamePriceToCostInProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :price, :cost
  end
end
```