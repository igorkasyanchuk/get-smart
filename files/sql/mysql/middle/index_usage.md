## 📚 Creating and Analyzing Indexes for Faster Reads
Indexes dramatically speed up lookups but slow down writes, so choose columns wisely. After creating an index, verify its usage with `SHOW INDEX` or `EXPLAIN`. Be cautious of over-indexing; focus on columns in `WHERE`, `JOIN`, and `ORDER BY` clauses.

```sql
CREATE INDEX idx_orders_date ON orders(created_at);
SHOW INDEX FROM orders;
```
