## 🗂️ Scale Large Tables with Range Partitioning
Range partitioning breaks a table into smaller segments based on key values, reducing scan times. You can also subpartition for multi-dimensional partitioning. Ensure your WHERE clauses filter on the partition key to benefit from partition pruning.

```sql
ALTER TABLE logs
PARTITION BY RANGE (YEAR(created_at)) (
  PARTITION p2021 VALUES LESS THAN (2022),
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);
```