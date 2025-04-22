## 🚀 Use Batch INSERTs/UPDATEs to Reduce Round Trips
Inserting or updating rows one at a time leads to many network round trips. Leverage multi-row `INSERT` or `UPDATE ... FROM` syntax to send bulk operations in a single query.

```sql
-- Bulk INSERT
INSERT INTO products (name, price)
VALUES
  ('Widget A', 9.99),
  ('Widget B', 14.99),
  ('Widget C', 7.49);

-- Bulk UPDATE
UPDATE inventory i
SET quantity = u.new_qty
FROM (VALUES (1, 100), (2, 200), (3, 150)) AS u(id, new_qty)
WHERE i.product_id = u.id;
```