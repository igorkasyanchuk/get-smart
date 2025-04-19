## 🧮 Add an Index for Performance

Indexes speed up queries on large tables. Generate a migration with `add_index` to improve lookup times, especially for foreign keys or frequently queried columns.

```ruby
# Terminal command
generate migration AddIndexToProductsName

# db/migrate/20230106060606_add_index_to_products_name.rb
class AddIndexToProductsName < ActiveRecord::Migration[6.1]
  def change
    add_index :products, :name
  end
end
```