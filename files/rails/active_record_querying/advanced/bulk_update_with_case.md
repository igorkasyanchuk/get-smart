## ⚙️ Bulk Updates with CASE Statements
Perform conditional bulk updates in a single query using `CASE` within `update_all`. This reduces N+1 updates and leverages the database to compute different values per row.

```ruby
# Adjust prices based on category
cases = "CASE WHEN category = 'A' THEN price * 1.1 WHEN category = 'B' THEN price * 1.2 ELSE price END"
Product.update_all("price = #{cases}")
```
