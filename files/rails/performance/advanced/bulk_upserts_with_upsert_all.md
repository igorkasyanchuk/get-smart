## 🧰 Bulk Upserts with insert_all/upsert_all

Rails 6+ provides `insert_all` and `upsert_all` for high‑performance bulk inserts and upserts in a single query. This avoids callbacks, validations, and reduces round‑trips, ideal for syncing large datasets.

```ruby
# Bulk insert new records
Product.insert_all([
  { sku: "A1", name: "Item A", price: 100 },
  { sku: "B2", name: "Item B", price: 200 }
])

# Bulk upsert (insert or update on conflict)
Widget.upsert_all(
  [{ id: 1, status: "active" }, { id: 2, status: "archived" }],
  unique_by: :id
)
```