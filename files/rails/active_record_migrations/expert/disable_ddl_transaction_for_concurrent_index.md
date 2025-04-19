## ⚡ Add Index Concurrently Without Transaction

By default Rails wraps migrations in a transaction, preventing the use of `CONCURRENTLY` with PostgreSQL. You can disable the DDL transaction for a migration to create indexes without locking writes.

```ruby
class AddUsersEmailIndexConcurrently < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    add_index :users, :email, algorithm: :concurrently, name: 'index_users_on_email_concurrently'
  end

  def down
    remove_index :users, name: 'index_users_on_email_concurrently', algorithm: :concurrently
  end
end
```

Ensure your app can handle concurrent schema changes and monitor lock behavior.