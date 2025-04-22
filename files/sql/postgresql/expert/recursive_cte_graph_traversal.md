## 🛠️ Traverse Hierarchies with Recursive CTEs

Use `WITH RECURSIVE` CTEs to implement efficient graph or tree traversals entirely in SQL. This avoids multiple round trips or client-side logic and can be optimized by the planner when depth is bounded.

```sql
WITH RECURSIVE category_tree AS (
  SELECT id, parent_id, name, 1 AS depth
  FROM categories
  WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.parent_id, c.name, ct.depth + 1
  FROM categories c
  JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT *
FROM category_tree
ORDER BY depth, id;
```