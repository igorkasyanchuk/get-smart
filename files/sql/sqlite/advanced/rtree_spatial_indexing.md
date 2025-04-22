## 🌐 Spatial Indexing with R*Tree Module
The R*Tree module provides efficient spatial indexing for bounding-box queries, ideal for GIS and spatial apps. Virtual tables store min/max coordinates and support range queries. Combine with SQL geometry functions for spatial analysis.

```sql
-- Create an R*Tree virtual table for rectangles
CREATE VIRTUAL TABLE geom_index USING rtree(
  id, minX, maxX, minY, maxY
);

-- Insert spatial data
INSERT INTO geom_index VALUES(1, 10, 20, 30, 40);

-- Query objects overlapping a region
SELECT id FROM geom_index
WHERE minX <= 25 AND maxX >= 15
  AND minY <= 35 AND maxY >= 25;
```