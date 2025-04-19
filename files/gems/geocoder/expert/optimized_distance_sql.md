## 🚀 Optimizing Distance Queries with Custom SQL and Haversine Formula
Leverage raw SQL to compute distances directly in the database, avoiding Ruby-level iteration and improving performance for large datasets. By injecting the Haversine formula into your ActiveRecord scopes, you only return the closest records without pulling all points into memory.

```ruby
# app/models/place.rb
class Place < ApplicationRecord
  # latitude_column and longitude_column are your geocoder fields
  scope :nearby, ->(lat, lon, radius_km = 10) {
    haversine = <<-SQL.squish
      6371 * acos(
        cos(radians(#{lat})) * cos(radians(latitude_column)) *
        cos(radians(longitude_column) - radians(#{lon})) +
        sin(radians(#{lat})) * sin(radians(latitude_column))
      )
    SQL

    select("*, #{haversine} AS distance_km")
      .where("#{haversine} < ?", radius_km)
      .order("distance_km ASC")
  }
end

# Usage:
Place.nearby(40.7128, -74.0060, 5)
```