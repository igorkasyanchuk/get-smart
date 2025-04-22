## 🛠️ Tuning WAL Mode and Checkpoints
Switch to Write‑Ahead Logging (WAL) for concurrent reads/writes, then tune automatic checkpoints to balance I/O. Manually checkpoint to control file growth and reduce latency spikes.

```sql
-- Enable WAL mode
PRAGMA journal_mode = WAL;

-- Set automatic checkpoint every 1000 pages
PRAGMA wal_autocheckpoint = 1000;

-- Force an immediate checkpoint
PRAGMA wal_checkpoint(TRUNCATE);
```
