## 🗂️ Create a New Table

When starting a new resource, generate a migration to create its database table. Rails will scaffold the proper timestamp and version for you, and you only need to define your columns inside the `change` method.

```ruby
# Terminal command
generate migration CreateProducts name:string price:decimal

# db/migrate/20230101010101_create_products.rb
class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string  :name
      t.decimal :price
      t.timestamps
    end
  end
end
```