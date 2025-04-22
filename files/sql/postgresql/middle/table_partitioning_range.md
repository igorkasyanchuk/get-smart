## 📦 Table Partitioning by Range

Range partitioning divides large tables into smaller child tables based on a range condition, improving query performance and maintenance. Define a parent table and attach partitions with specific bounds.

```sql
-- Create parent table
CREATE TABLE logs (
  id serial PRIMARY KEY,
  log_time timestamptz NOT NULL,
  message text
) PARTITION BY RANGE (log_time);

-- Create monthly partitions
CREATE TABLE logs_2023_01 PARTITION OF logs
  FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');
```
