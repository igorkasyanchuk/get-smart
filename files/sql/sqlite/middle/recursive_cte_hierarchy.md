## 🔄 Handling Hierarchical Data with Recursive CTEs

Recursive CTEs enable querying tree-like structures such as category hierarchies. Define an anchor member and a recursive member that references the CTE itself to walk the tree.

```sql
WITH RECURSIVE category_tree(id, name, parent_id, depth) AS (
  SELECT id, name, parent_id, 0 FROM categories WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id, ct.depth + 1
  FROM categories c
  JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT printf('%s%s', substr('  ',1,depth*2), name) AS indented_name
FROM category_tree
ORDER BY depth, name;
```