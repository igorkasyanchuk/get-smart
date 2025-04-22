## 🔎 Using EXPLAIN to Analyze Query Performance
Use the `EXPLAIN` statement to get insight into how MySQL executes your queries. This helps you identify table scans, index usage, and join strategies. By reviewing the output, you can adjust indexes or rewrite queries for better performance.

```sql
EXPLAIN SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id
WHERE orders.created_at > '2023-01-01';
```
