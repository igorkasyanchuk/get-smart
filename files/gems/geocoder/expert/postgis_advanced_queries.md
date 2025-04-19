## 🌐 Integrating PostGIS for Advanced Spatial Queries
Use PostgreSQL’s PostGIS extension for highly efficient geospatial indexing and queries. With ActiveRecord adapter and rgeo, you can store `geometry` columns and perform intersections, buffers, and nearest‐neighbor searches in SQL.

```ruby
# migration
enable_extension 'postgis'

create_table :locations do |t|
  t.st_point :geom, geographic: true, null: false
  t.string  :name
end
add_index :locations, :geom, using: :gist

# app/models/location.rb
class Location < ApplicationRecord
  RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
    config.default = RGeo::Geographic.spherical_factory(srid: 4326)
  end

  # Find locations within a 5km buffer
  scope :within_buffer, ->(lon, lat, km = 5) {
    point = RGeo::Geographic.spherical_factory(srid: 4326).point(lon, lat)
    where(%{
      ST_DWithin(
        geom,
        ST_GeogFromText('SRID=4326;POINT(%f %f)'),
        %d * 1000
      )
    } % [lon, lat, km])
  }
end

# Usage:
Location.within_buffer(-122.4194, 37.7749, 10)
```