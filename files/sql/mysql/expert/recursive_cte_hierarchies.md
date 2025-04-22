## 🌳 Recursive CTEs for Hierarchical Data

Recursive Common Table Expressions (CTEs) let you traverse trees and graphs natively, avoiding stored procedures. Use `WITH RECURSIVE` to join parent-child rows iteratively, controlling cycle detection and max depth.

```sql
WITH RECURSIVE employee_hierarchy AS (
  SELECT id, manager_id, name, 1 AS depth
  FROM employees
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.manager_id, e.name, eh.depth + 1
  FROM employees e
  JOIN employee_hierarchy eh ON e.manager_id = eh.id
)
SELECT * FROM employee_hierarchy;
```
