## 📦 Complex JSON Queries with JSON1
Use the JSON1 extension to store and query JSON documents natively. Extract nested values, filter by keys, and aggregate JSON arrays without external parsers.

```sql
-- Retrieve all order IDs where status is "shipped"
SELECT json_extract(data, '$.order_id') AS order_id
  FROM orders
 WHERE json_extract(data, '$.status') = 'shipped';

-- Aggregate a JSON array field
SELECT json_group_array(json_extract(data, '$.item_id')) AS items
  FROM orders;
```
