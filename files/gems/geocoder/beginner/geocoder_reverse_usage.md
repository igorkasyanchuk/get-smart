## 🔄 Perform Reverse Geocoding

Reverse geocoding lets you convert coordinates back into a human-readable address. Use `reverse_geocoded_by` in your model or call `Geocoder.search` directly when needed, for example, to display the nearest address from latitude/longitude.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country
    end
  end
  after_validation :reverse_geocode, if: ->(obj){ obj.latitude_changed? || obj.longitude_changed? }
end

# Or on the fly
results = Geocoder.search([40.7143528, -74.0059731])
address = results.first.address  # "New York, NY, USA"
```