## 📈 Monitor Index Usage with pg_stat_user_indexes
Not all indexes you create get used; unused indexes waste space and degrade write performance. Query the `pg_stat_user_indexes` view to identify missing or unused indexes.

```sql
SELECT
  schemaname,
  relname AS table,
  indexrelname AS index,
  idx_scan AS times_used
FROM pg_stat_user_indexes
ORDER BY idx_scan ASC
LIMIT 10;
```