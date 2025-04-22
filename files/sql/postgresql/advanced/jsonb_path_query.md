## 🗄️ Advanced JSONB Path Queries
Leverage PostgreSQL’s `jsonb_path_query` to query deeply nested JSON documents with JSONPath expressions. This approach is more powerful than simple operator-based filtering and supports wildcards, filters, and predicates inside JSON structures. It helps you extract, search, or modify nested values without unnesting entire JSON arrays manually.

```sql
SELECT id,
       jsonb_path_query(data, '$.orders[*] ? (@.status == "shipped")') AS shipped_orders
FROM customers
WHERE data ? 'orders';
```