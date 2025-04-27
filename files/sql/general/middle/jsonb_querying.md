## 💡 Query JSONB Data Efficiently with Indexes
Store semi-structured data in `jsonb` columns and query keys using the `->>` operator. Create a `GIN` index on the `jsonb` column to speed up key/value lookups.

```sql
-- Create GIN index
CREATE INDEX idx_orders_metadata ON orders USING GIN (metadata);

-- Query JSONB with index
SELECT *
FROM orders
WHERE metadata ->> 'status' = 'shipped';
```