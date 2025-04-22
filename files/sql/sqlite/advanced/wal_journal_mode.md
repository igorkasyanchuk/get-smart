## 🏎 Boost Concurrency with WAL Journal Mode
Write-Ahead Logging (WAL) mode allows concurrent reads and writes, improving throughput under high concurrency. WAL files append changes and checkpoint asynchronously. Switch modes to reduce lock contention in multi-threaded or multi-process scenarios.

```sql
-- Enable WAL mode
PRAGMA journal_mode = WAL;

-- Control checkpoint threshold (default 100)
PRAGMA wal_autocheckpoint = 200;

-- Check current journal mode
PRAGMA journal_mode;
```