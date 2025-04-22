## ➕ Upsert with Conditional `ON CONFLICT` DO UPDATE
Utilize the `ON CONFLICT` clause to perform atomic upserts, avoiding race conditions when inserting or updating rows. You can conditionally update only certain columns based on excluded values or add a `WHERE` clause to restrict updates. This pattern simplifies merging incoming data into existing tables.

```sql
INSERT INTO inventory (product_id, stock)
VALUES (42, 100)
ON CONFLICT (product_id) DO UPDATE
SET stock = inventory.stock + EXCLUDED.stock
WHERE inventory.updated_at < NOW() - INTERVAL '1 hour';
```