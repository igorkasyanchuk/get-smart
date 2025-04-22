## 🥡 Optimize JSON with Generated Columns and Indexes

Storing JSON in MySQL is flexible but slow for searching. Define virtual or stored generated columns to extract JSON keys, then index them for lightning-fast lookups. Stored columns persist on disk; virtual are computed on demand.

```sql
ALTER TABLE events
  ADD COLUMN event_type VARCHAR(50)
    AS (JSON_UNQUOTE(JSON_EXTRACT(payload, '$.type'))) STORED,
  ADD INDEX idx_event_type (event_type);

SELECT * FROM events
WHERE event_type = 'user_signup';
```
