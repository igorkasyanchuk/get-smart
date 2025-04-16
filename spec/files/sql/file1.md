### 📌 SQL Tip: Quickly Find Duplicate Rows Using `GROUP BY` and `HAVING`

Easily detect duplicate entries in SQL by grouping rows and using `HAVING COUNT(*)`.

**Example:**

```sql
SELECT email, COUNT(*) AS occurrences
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```
