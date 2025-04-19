## ➕ Upsert Records with `insert_all` and `on_duplicate`

Rails 6+ provides bulk upsert methods to efficiently insert or update multiple rows. `insert_all` with `unique_by` reduces round trips and handles conflicts at the database level.

```ruby
Product.insert_all(
  [
    { sku: 'ABC123', name: 'Gadget', price: 19.99 },
    { sku: 'XYZ789', name: 'Widget', price: 29.99 }
  ],
  unique_by: :sku
)
```