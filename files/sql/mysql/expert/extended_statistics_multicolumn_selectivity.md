## 📊 Create Extended Statistics for Better Multi-Column Plans

Standard single-column histograms can misestimate row counts for combined filters. MySQL’s extended statistics let you track correlation and distinct counts across multiple columns, improving join and range query selectivity.

```sql
CREATE STATISTICS stat_user_region_age
  ON users (region_id, age)
  COMMENT 'Track correlation for region and age';
ANALYZE TABLE users;

EXPLAIN SELECT *
FROM users
WHERE region_id = 5 AND age BETWEEN 30 AND 40;
```
