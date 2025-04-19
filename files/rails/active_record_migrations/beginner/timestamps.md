## ⏱️ Add Timestamps to an Existing Table

Timestamps (`created_at` and `updated_at`) help track record changes. Use `add_timestamps` to include them in tables that lack these fields.

```ruby
# Terminal command
generate migration AddTimestampsToProducts

# db/migrate/20230108080808_add_timestamps_to_products.rb
class AddTimestampsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :products, null: true
    # backfill existing rows if necessary:
    Product.update_all(created_at: Time.current, updated_at: Time.current)
    change_column_null :products, :created_at, false
    change_column_null :products, :updated_at, false
  end
end
```