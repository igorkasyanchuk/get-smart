## 💡 Manage Materialized Views

Materialized views can speed up complex queries by caching results. Define them in migrations via `execute` and provide a helper to refresh periodically. Remember to drop the view in down migrations to keep the schema reversible.

```ruby
class CreateUserStatsMaterializedView < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE MATERIALIZED VIEW user_stats AS
      SELECT user_id, COUNT(*) AS posts_count
      FROM posts
      GROUP BY user_id;
    SQL
  end

  def down
    execute 'DROP MATERIALIZED VIEW user_stats;'
  end
end
```