## 🚀 Analyze Queries with EXPLAIN and PRAGMA optimize
Use `EXPLAIN QUERY PLAN` to inspect how SQLite executes queries and which indexes are used. Combine it with `PRAGMA optimize` to rebuild internal structures for better performance. Regular analysis helps you spot missing indexes and inefficient scans.

```sql
-- Show query plan
EXPLAIN QUERY PLAN
SELECT * FROM orders WHERE customer_id = 42;

-- Defragment database and optimize indices
PRAGMA optimize;
```