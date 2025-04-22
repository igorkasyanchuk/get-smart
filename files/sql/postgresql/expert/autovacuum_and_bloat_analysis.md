## 📊 Tune Autovacuum & Analyze Table Bloat with pgstattuple

Excessive bloat degrades performance; use `pgstattuple` to quantify dead tuples and adjust autovacuum thresholds. Then perform manual `VACUUM (FULL)` sparingly to reclaim space.

```sql
-- Enable extension and inspect bloat
CREATE EXTENSION IF NOT EXISTS pgstattuple;
SELECT * FROM pgstattuple('public.big_table');

-- Adjust autovacuum settings for high-activity tables
ALTER TABLE public.big_table SET (
  autovacuum_vacuum_scale_factor = 0.05,
  autovacuum_vacuum_threshold = 500
);

-- Cleanup once bloat exceeds threshold
VACUUM (FULL, VERBOSE, ANALYZE) public.big_table;
```