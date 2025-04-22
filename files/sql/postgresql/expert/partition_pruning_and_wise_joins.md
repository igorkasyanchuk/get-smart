## 🔍 Leverage Partition Pruning and Partition-Wise Joins

Declarative partitioning can drastically speed up large-table joins by pruning irrelevant partitions early and enabling partition-wise join strategies. Ensure your `WHERE` clauses align with partition keys, and the planner will eliminate partitions at planning time, reducing I/O.

```sql
-- Parent table
CREATE TABLE events (
  id serial PRIMARY KEY,
  event_date date NOT NULL,
  user_id int NOT NULL
) PARTITION BY RANGE (event_date);

-- Monthly partitions
CREATE TABLE events_2023_01 PARTITION OF events
  FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

-- Pruned join
EXPLAIN ANALYZE
SELECT e.*, u.name
FROM events e
JOIN users u ON e.user_id = u.id
WHERE e.event_date BETWEEN '2023-01-01' AND '2023-01-31';
```