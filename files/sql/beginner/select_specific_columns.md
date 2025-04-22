## 🔍 Select Specific Columns

Selecting only the columns you need can improve readability and performance. Use a comma-separated list instead of `*` to retrieve specific fields.

```sql
SELECT id, first_name, last_name
FROM users;
```

This returns only the `id`, `first_name`, and `last_name` columns, reducing data transfer and making intent clear.
