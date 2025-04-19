## ➕ Add a Column to an Existing Table

To introduce a new attribute, generate an additive migration. Use `add_column` inside `change` so Rails can roll it back automatically.

```ruby
# Terminal command
generate migration AddDescriptionToProducts description:text

# db/migrate/20230102020202_add_description_to_products.rb
class AddDescriptionToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :description, :text, default: ""
  end
end
```