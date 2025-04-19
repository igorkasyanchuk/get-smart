## 📅 Utilize SQL Default Expressions

Use database functions as default values for columns to offload work from the application. Define them with `default: -> { 'NOW()' }` in Rails migrations for timestamps or generated values.

```ruby
class AddExpiresAtWithDefault < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :expires_at, :datetime, default: -> { "NOW() + INTERVAL '1 hour'" }, null: false
  end
end
```