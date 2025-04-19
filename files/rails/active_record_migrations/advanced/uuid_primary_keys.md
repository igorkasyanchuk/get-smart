## 🐘 Use UUID Primary Keys

Switching primary keys to UUIDs can improve sharding and security. Enable the `pgcrypto` extension and set `id: :uuid` when creating tables. You can also change existing tables by enabling the extension and altering the column type with data backfill.

```ruby
class CreateOrdersWithUuid < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :orders, id: :uuid do |t|
      t.string :status
      t.timestamps
    end
  end
end
```