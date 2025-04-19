## 🗃️ Add Database Indexes
Indexes speed up query lookups on large tables. Identify frequently queried columns (e.g., foreign keys, email) and add indexes to improve performance.

```ruby
# Migration to add index on users.email
add_index :users, :email

# Migration to add composite index
add_index :orders, [:user_id, :created_at]
```