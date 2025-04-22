## 🔗 Combining Tables with INNER JOIN
`INNER JOIN` returns rows with matching values in both tables. It's ideal for fetching related records.

```sql
SELECT orders.id, users.name, orders.total
FROM orders
INNER JOIN users
  ON orders.user_id = users.id;
```