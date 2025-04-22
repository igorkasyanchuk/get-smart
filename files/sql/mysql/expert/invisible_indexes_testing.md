## 🔍 Use Invisible Indexes for Safe Index Tuning

Invisible indexes (MySQL 8.0+) let you disable an index without dropping it, to test its impact on plan stability and performance. Convert an index to invisible, monitor performance via `EXPLAIN`, and revert if needed.

```sql
-- Make index invisible
ALTER TABLE orders
  ALTER INDEX idx_customer_date INVISIBLE;

-- Test query plans
EXPLAIN SELECT *
FROM orders
WHERE customer_id = 42 AND order_date > '2023-01-01';

-- Revert if performance regresses
ALTER TABLE orders
  ALTER INDEX idx_customer_date VISIBLE;
```
