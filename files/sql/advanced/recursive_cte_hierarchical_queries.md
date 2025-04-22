## 🌳 Use Recursive CTEs for Hierarchical Data
Recursive Common Table Expressions (CTEs) handle tree‐structured or graph‐based data elegantly. Define an anchor query and a recursive member to traverse parent‐child relationships.

```sql
WITH RECURSIVE category_tree AS (
  SELECT id, name, parent_id, 1 AS depth
  FROM categories
  WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id, ct.depth + 1
  FROM categories c
  JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT * FROM category_tree ORDER BY depth, name;
```

This builds a depth‐annotated hierarchy of categories, suitable for breadcrumbs or organizational charts.