## 🧩 Accelerate JSONB Queries with GIN Indexes
JSON(B) columns can be indexed to speed up containment and path searches. Create a GIN index on the JSONB column and use the `@>` operator for efficient lookups.

```sql
CREATE INDEX idx_orders_metadata ON orders USING GIN (metadata jsonb_path_ops);

SELECT *
FROM orders
WHERE metadata @> '{"status": "shipped", "priority": "high"}';
```

The GIN index ensures the query uses index scans instead of full table scans, significantly boosting performance.