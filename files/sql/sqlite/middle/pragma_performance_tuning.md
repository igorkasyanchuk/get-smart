## 🧹 Tuning Performance with PRAGMA Commands

`PRAGMA` statements let you inspect and configure SQLite internals. Use `ANALYZE` to update statistics, `cache_size` to adjust memory, and `journal_mode` for durability vs. speed.

```sql
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
PRAGMA cache_size = 2000;
ANALYZE;

-- Check table info:
PRAGMA table_info(users);
```