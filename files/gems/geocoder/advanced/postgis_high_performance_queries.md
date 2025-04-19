## 🚀 Leveraging PostGIS for High-Performance Geospatial Queries

By using PostGIS and its spatial functions directly in your Rails app, you can perform million‑row radius and distance calculations in milliseconds. Begin by creating a geographic point column and adding a GiST index:

```ruby
class AddCoordinatesToLocations < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'postgis'

    create_table :locations do |t|
      t.st_point :coordinates, geographic: true
      t.string   :name
      t.timestamps
    end

    add_index :locations, :coordinates, using: :gist
  end
end
```

Next, define a scope that uses PostGIS’s `ST_DistanceSphere` for precise measurement:

```ruby
class Location < ApplicationRecord
  # Returns locations within a given radius (in meters) from a point
  scope :within_radius, ->(lat, lng, radius_in_meters) do
    select("*, ST_DistanceSphere(coordinates, 'SRID=4326;POINT(%f %f)') AS distance" % [lng, lat])
      .where("ST_DWithin(coordinates, 'SRID=4326;POINT(%f %f)'::geography, ?)", lng, lat, radius_in_meters)
      .order('distance')
  end
end
```

Now you can query:

```ruby
nearby = Location.within_radius(40.7128, -74.0060, 5000)
nearby.each do |loc|
  puts "#{loc.name} is #{loc.distance.round} meters away"
end
```