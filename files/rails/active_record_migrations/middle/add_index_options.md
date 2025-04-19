## ⚡ Add Indexes with Custom Options

Custom index options like `unique`, custom `name`, and `using` can optimize lookups and avoid name collisions. Always name your indexes to ease future maintenance.

```ruby
class AddUniqueEmailIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email,
      unique: true,
      name: 'index_users_on_email_unique',
      using: :btree
  end
end
```
