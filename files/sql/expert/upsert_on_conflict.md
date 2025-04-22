## ⚔️ Upsert with ON CONFLICT
Perform atomic insert-or-update operations using `INSERT ... ON CONFLICT` to eliminate race conditions and lock overhead from separate SELECT/UPDATE patterns.

```sql
INSERT INTO inventory (product_id, quantity)
VALUES (42, 10)
ON CONFLICT (product_id)
DO UPDATE SET
  quantity = inventory.quantity + EXCLUDED.quantity,
  last_updated = NOW();
```

This single statement safely increments stock levels or adds new records. You can also add a `WHERE` clause in the `DO UPDATE` for conditional upserts.