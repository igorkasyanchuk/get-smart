## 💡 Bulk Upsert with on_duplicate_key
ActiveRecord 6.1+ supports `insert_all` and `upsert_all` for bulk insertions and conflict resolution. Use `unique_by` to specify indexes and perform upserts in a single SQL operation, saving round trips and avoiding transaction locks.

```ruby
Product.upsert_all(
  [ { sku: 'ABC123', stock: 10 }, { sku: 'XYZ789', stock: 5 } ],
  unique_by: :sku
)
``` 

This is ideal for syncing large data feeds, inventory updates, or any bulk data ingestion pipeline.