## 🛠️ Defining Custom PostgreSQL Enums via ActiveRecord

Create native Postgres enums in migrations and map them to Ruby symbols with the attribute API. This ensures type safety and database-level constraints.

```ruby
# db/migrate/XXXX_create_order_status_enum.rb
class CreateOrderStatusEnum < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE order_status AS ENUM ('pending', 'paid', 'shipped', 'cancelled');
    SQL
    add_column :orders, :status, :order_status, default: 'pending', null: false
  end

  def down
    remove_column :orders, :status
    execute "DROP TYPE order_status;"
  end
end

# app/models/order.rb
class Order < ApplicationRecord
  attribute :status, :string
  enum status: { pending: 'pending', paid: 'paid', shipped: 'shipped', cancelled: 'cancelled' }
end
```
