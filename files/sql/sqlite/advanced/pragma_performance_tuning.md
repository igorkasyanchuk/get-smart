## 🧰 Tune Database Performance with PRAGMA Settings
SQLite exposes many `PRAGMA` commands to adjust performance parameters like cache size, synchronous mode, and auto-vacuum. Fine-tune these settings based on your workload (OLTP vs. OLAP) to balance durability and throughput.

```sql
-- Increase page cache to speed up reads
PRAGMA cache_size = 2000;

-- Disable synchronous writes for faster commits (risk of data loss on crash)
PRAGMA synchronous = OFF;

-- Enable auto-vacuum to reclaim free space
PRAGMA auto_vacuum = FULL;
```