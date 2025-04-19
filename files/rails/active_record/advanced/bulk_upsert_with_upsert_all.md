## 🔥 Bulk Upsert with `upsert_all`

Rails 6+ supports bulk upsert to efficiently insert or update multiple records in one query. This is ideal for syncing large datasets without N+1 overhead.

```ruby
Order.upsert_all([
  { id: 1, status: "shipped", updated_at: Time.current },
  { id: 2, status: "pending", updated_at: Time.current }
], unique_by: :id)
```
This will insert new rows or update existing ones based on the `:id` unique constraint.