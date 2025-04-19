## 📍 Setup Forward and Reverse Geocoding

Integrate Geocoder into your ActiveRecord models to automatically convert addresses to coordinates (forward geocoding) and vice versa (reverse geocoding). This lets you store latitude/longitude in the database and display human‑readable locations when needed.

1. Add Geocoder to your Gemfile and run `bundle install`:

```ruby
# Gemfile
gem 'geocoder'
```

2. Generate latitude and longitude columns:

```bash
rails generate migration AddLatitudeAndLongitudeToUsers latitude:float longitude:float
rails db:migrate
```

3. Configure the model:

```ruby
class User < ApplicationRecord
  # Forward geocoding: address -> latitude, longitude
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }

  # Reverse geocoding: latitude, longitude -> city, state
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if (loc = results.first)
      obj.city  = loc.city
      obj.state = loc.state
    end
  end
  after_validation :reverse_geocode, if: ->(obj){ obj.latitude_changed? || obj.longitude_changed? }
end
```

Now saving or updating a user’s `address` populates `latitude`/`longitude`, and updating coordinates populates city/state.