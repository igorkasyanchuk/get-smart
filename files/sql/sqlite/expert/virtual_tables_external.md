## 🌐 Virtual Tables & External Data Integration
Mount external data sources like CSV or R‑Tree spatial indexes as virtual tables. Query them as if they were native tables, enabling spatial queries or quick CSV imports.

```sql
-- CSV virtual table via the CSV extension
CREATE VIRTUAL TABLE temp.imported_data
  USING csv(filename='data.csv', header=YES);

-- R*Tree virtual table for spatial indexing
CREATE VIRTUAL TABLE geom_index USING rtree(
  id, minX, maxX, minY, maxY
);
```
