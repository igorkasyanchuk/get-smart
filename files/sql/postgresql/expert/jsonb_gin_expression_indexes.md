## 🚀 Accelerate JSONB Queries with GIN & Expression Indexes

Complex JSONB queries require targeted indexing to avoid full scans. Create GIN indexes on jsonb paths or expression indexes for frequent filters, and specify `jsonb_path_ops` where applicable to minimize index size.

```sql
-- GIN index on a nested key
CREATE INDEX idx_orders_data_customer ON orders
  USING GIN ((data->'customer') jsonb_path_ops);

-- Expression index on extracted value
CREATE INDEX idx_orders_data_status ON orders
  ((data->>'status'));

-- Query utilizing the expression index
SELECT * FROM orders
WHERE data->>'status' = 'shipped';
```