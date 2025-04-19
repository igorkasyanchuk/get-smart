## 📦 Bulk Inserts and Upserts with `insert_all`
Use `insert_all` and `upsert_all` to bypass callbacks for high-throughput writes. Manage constraints and on-conflict behavior directly in SQL for performance.

```ruby
records = users.map { |u| { email: u.email, name: u.name, created_at: Time.now, updated_at: Time.now } }

User.insert_all(records)
# Upsert example
User.upsert_all(records, unique_by: :email)
```