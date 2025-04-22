## 📊 Sort and Limit Results
Control result order with `ORDER BY` and restrict rows with `LIMIT`:

```sql
-- Latest users first, show only 5
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 5;
```