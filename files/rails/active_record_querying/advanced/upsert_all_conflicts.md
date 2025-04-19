## ⬆️ Use upsert_all with Conflict Targets
Rails 6+ provides `upsert_all` to batch-insert records and handle conflicts via `unique_by`. This is ideal for high-performance data ingestion without multiple round trips.

```ruby
# Bulk insert or update products by SKU
Product.upsert_all([
  {sku: 'A100', name: 'Widget', price: 9.99},
  {sku: 'B200', name: 'Gadget', price: 19.99}
], unique_by: :sku)
```
