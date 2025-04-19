## 🕵️‍♂️ Recursive CTEs for Hierarchical Data
Use recursive CTEs to query tree-structured data such as category hierarchies or organizational charts. ActiveRecord can embed raw SQL recursive clauses to fetch all descendants or ancestors in a single query.

```ruby
cte = <<~SQL
  WITH RECURSIVE category_tree AS (
    SELECT id, name, parent_id FROM categories WHERE id = :root_id
    UNION ALL
    SELECT c.id, c.name, c.parent_id FROM categories c
    INNER JOIN category_tree ct ON ct.id = c.parent_id
  ) SELECT * FROM category_tree;
SQL
Category.find_by_sql([cte, { root_id: 1 }])
``` 

This approach is far more efficient than iterative Ruby traversals for deep hierarchies.