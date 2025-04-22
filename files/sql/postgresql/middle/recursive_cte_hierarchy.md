## 📋 Recursive CTEs for Hierarchical Data

Recursive CTEs let you traverse hierarchical relationships—ideal for organizational charts or category trees—in a single query. By defining an anchor member and a recursive member, you iteratively build a result set with depth information.

```sql
WITH RECURSIVE subordinates AS (
  SELECT id, name, manager_id, 1 AS level
  FROM employees
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, e.manager_id, s.level + 1
  FROM employees e
  JOIN subordinates s ON e.manager_id = s.id
)
SELECT *
FROM subordinates
ORDER BY level, name;
```
