## 📂 Declarative Range Partitioning for Large Tables
Partition large fact tables by range (e.g., date or numeric ranges) to improve query performance and management. PostgreSQL’s declarative partitioning automatically routes inserts to the correct partition and prunes irrelevant partitions at query time. Create child tables with check constraints for each range.

```sql
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  event_time TIMESTAMP NOT NULL,
  payload JSONB
) PARTITION BY RANGE (event_time);

CREATE TABLE events_2023_q1 PARTITION OF events
  FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE TABLE events_2023_q2 PARTITION OF events
  FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');
```