## 🚧 Fine-Tune Partition Pruning with Expression Partitions

Partitioning by expressions (e.g., `TO_DAYS(date) DIV 7`) can group data by week, month, or custom buckets. Ensure your WHERE clause matches the partition expression to enable pruning. Use `EXPLAIN PARTITIONS` to verify pruned partitions.

```sql
CREATE TABLE metrics (
  ts DATETIME,
  value DOUBLE
)
PARTITION BY RANGE (YEAR(ts)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024)
);

EXPLAIN PARTITIONS SELECT *
FROM metrics
WHERE ts BETWEEN '2023-05-01' AND '2023-06-01';
```
