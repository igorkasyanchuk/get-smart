## 🧠 Advanced PRAGMA Flags for Optimization
Fine‑tune SQLite internals with PRAGMA flags. Adjust cache size, synchronous behavior, and memory mapping to tailor performance to your hardware.

```sql
-- Increase page cache to 10000 pages
PRAGMA cache_size = -10000;

-- Disable fsync for faster writes (risk of corruption on crash)
PRAGMA synchronous = OFF;

-- Enable mmap for reads (size in bytes)
PRAGMA mmap_size = 30000000000;
```
