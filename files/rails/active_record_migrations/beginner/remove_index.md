## 🚫 Remove an Unused Index

Stale or unnecessary indexes waste space and slow down writes. Use `remove_index` to clean them up when they’re no longer needed.

```ruby
# Terminal command
generate migration RemoveIndexFromProductsName

# db/migrate/20230107070707_remove_index_from_products_name.rb
class RemoveIndexFromProductsName < ActiveRecord::Migration[6.1]
  def change
    remove_index :products, :name
  end
end
```