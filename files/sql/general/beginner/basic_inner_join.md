## 🔗 Combine Tables with INNER JOIN

`INNER JOIN` lets you retrieve related data from multiple tables. Specify matching columns in the `ON` clause.

```sql
SELECT orders.id, users.first_name, users.last_name
FROM orders
INNER JOIN users ON orders.user_id = users.id;
```

This returns each order along with the first and last name of the user who placed it.