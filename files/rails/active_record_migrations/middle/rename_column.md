## 🔄 Rename Columns Safely

Use `rename_column` to update your schema and automatically update ActiveRecord mappings. Be cautious: renaming a column on a large table can lock it, so consider breaking this into multiple migrations if needed.

```ruby
class RenameUsernameToLogin < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :login
  end
end
```
