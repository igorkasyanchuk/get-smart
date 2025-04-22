## 🔧 Profile Slow Queries with performance_schema Events

Use `performance_schema` to capture detailed timing, I/O, and wait events without external tools. Enable relevant instruments, capture data into tables, and join with `events_statements_history` to pinpoint hotspots.

```sql
UPDATE performance_schema.setup_instruments
SET ENABLED = 'YES', TIMED = 'YES'
WHERE NAME LIKE 'statement/%';

SELECT esh.SQL_TEXT,
       esh.TIMER_WAIT AS nanoseconds,
       io.COUNT_STAR AS io_operations
FROM performance_schema.events_statements_history esh
JOIN performance_schema.events_waits_summary_global_by_event_name io
  ON esh.EVENT_ID = io.EVENT_ID
ORDER BY esh.TIMER_WAIT DESC
LIMIT 10;
```
