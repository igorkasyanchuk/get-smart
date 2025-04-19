## 🚀 Add Index Concurrently

Rails wraps migrations in transactions by default on PostgreSQL, but creating indexes concurrently requires disabling the transaction wrap. You can call `disable_ddl_transaction!` and specify `algorithm: :concurrently` to reduce downtime. This approach ensures the index build does not block writes on large tables.

```ruby
class AddIndexToUsersEmailConcurrently < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :users, :email, unique: true, algorithm: :concurrently
  end

  def down
    remove_index :users, :email, algorithm: :concurrently
  end
end
```