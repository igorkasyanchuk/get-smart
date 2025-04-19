## 🚀 Master Partial & Expression Indexes

Leverage PostgreSQL’s partial and expression indexes to minimize index size and boost query performance by indexing only the rows or expressions you actually need. This is invaluable for tables with heterogeneous data distributions or large JSONB columns where only a subset is queried frequently.

```ruby
# Add a partial index to only index active users
class AddActiveUsersIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email,
      unique: true,
      where: "status = 'active'"

    # Expression index on lower(email) for case‐insensitive searches
    execute <<~SQL
      CREATE INDEX index_users_on_lower_email ON users (lower(email));
    SQL
  end
end
```

Use `EXPLAIN ANALYZE` to verify index usage and adjust the `WHERE` clause or expression to match your hottest paths.