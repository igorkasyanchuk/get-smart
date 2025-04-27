## 🗂️ Declarative Partitioning with Pruning
Use table partitioning by range or list to improve query performance via automatic partition pruning.

```sql
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  order_date DATE NOT NULL,
  customer_id INT,
  amount NUMERIC
) PARTITION BY RANGE (order_date);

CREATE TABLE orders_2023
  PARTITION OF orders
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE orders_2024
  PARTITION OF orders
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
```

Queries filtering on `order_date` will only scan relevant partitions. Combine with `VACUUM` on older partitions to reclaim space.