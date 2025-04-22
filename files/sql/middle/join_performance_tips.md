## ⚡ Optimize JOIN Order and Types for Performance
The order and type of JOINs affect query planning and execution time. Prefer smaller tables or highly selective conditions first, and choose appropriate join types (INNER vs. LEFT) to help the planner pick efficient strategies.

```sql
-- Prefer INNER JOIN when filtering out unmatched rows
SELECT a.id, b.info
FROM authors a
INNER JOIN books b ON b.author_id = a.id
WHERE a.country = 'USA';
```