## 📊 Count Rows with COUNT()

`COUNT()` is an aggregate function that returns the number of rows matching a condition. It’s handy for getting quick totals.

```sql
SELECT COUNT(*) AS total_users
FROM users
WHERE active = TRUE;
```

This counts how many users have `active = TRUE` and returns the result as `total_users`.