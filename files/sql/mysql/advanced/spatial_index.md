## 🌐 Optimize Geospatial Queries with SPATIAL Indexes
MySQL’s SPATIAL indexes speed up geometric queries on supported data types like POINT and POLYGON. Combine them with functions like ST_Distance_Sphere for great performance on location-based searches. Ensure your MySQL engine supports MyISAM or InnoDB SPATIAL indexing.

```sql
ALTER TABLE locations
ADD COLUMN geom POINT NOT NULL,
ADD SPATIAL INDEX sp_idx_geom (geom);

SELECT id, name
FROM locations
WHERE ST_Distance_Sphere(
  geom,
  ST_GeomFromText('POINT(-73.9857 40.7484)')
) < 5000;
```