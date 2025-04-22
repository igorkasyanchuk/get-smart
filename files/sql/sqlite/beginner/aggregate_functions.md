## 📊 Using Aggregate Functions

Aggregate functions let you calculate summary data like counts, sums, averages, and more over a group of rows.

```sql
-- Count total users
SELECT COUNT(*) AS user_count FROM users;

-- Average id value
SELECT AVG(id) AS average_id FROM users;
```
