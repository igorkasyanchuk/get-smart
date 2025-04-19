## 🗂️ Advanced JSONB Querying
PostgreSQL's JSONB type allows nested document storage and powerful querying. Use `where` with containment operators (`@>`, `->`, `->>`) or `jsonb_extract_path_text` for deep keys. Index these fields with GIN indexes for fast lookups in large datasets.

```ruby
# Find orders where metadata contains a gift note
orders = Order.where("metadata @> ?", {gift: true}.to_json)
# Extract nested customer city
cities = Customer.pluck(Arel.sql("metadata ->> 'address' ->> 'city'"))
```
