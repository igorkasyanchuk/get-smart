## 🛠️ Execute Raw SQL in Migrations

When ActiveRecord methods aren’t sufficient (e.g., complex indexes or vendor-specific syntax), use `execute` to run raw SQL. Ensure you write reversible statements or define both `up`/`down`.

```ruby
class AddPartialIndexWithSql < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE INDEX index_users_active_on_email
      ON users(email)
      WHERE active = true;
    SQL
  end

  def down
    execute "DROP INDEX index_users_active_on_email"
  end
end
```
