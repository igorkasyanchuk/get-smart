## 🗑️ Remove a Column from a Table

When an attribute becomes obsolete, use `remove_column` to drop it. Rails will automatically reverse the operation when rolling back.

```ruby
# Terminal command
generate migration RemoveDescriptionFromProducts description:string

# db/migrate/20230103030303_remove_description_from_products.rb
class RemoveDescriptionFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :description, :text
  end
end
```