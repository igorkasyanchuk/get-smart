## 🔄 Performing Bulk Upserts with upsert_all

Use `insert_all` or `upsert_all` for high-performance bulk inserts/updates without callbacks and validations. On Postgres, specify `unique_by` to perform upserts on conflict.

```ruby
# Prepare data
records = [
  { email: 'a@example.com', name: 'Alice', updated_at: Time.current },
  { email: 'b@example.com', name: 'Bob',   updated_at: Time.current }
]

# Bulk upsert
User.upsert_all(records, unique_by: :index_users_on_email)
```
