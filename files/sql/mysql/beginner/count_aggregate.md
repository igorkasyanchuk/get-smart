## 🧮 Using COUNT to Aggregate Data
`COUNT()` returns the number of rows that match a condition. It’s useful for summary reports and dashboards.

```sql
-- Count total users
SELECT COUNT(*) AS total_users
FROM users;

-- Count active orders
SELECT COUNT(*) AS active_orders
FROM orders
WHERE status = 'active';
```