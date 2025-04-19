## 📍 Add Geocoding to Your Model

In your model (e.g., `User`), use `geocoded_by` with the address attribute and trigger geocoding with a callback. This ensures that whenever the address changes, Geocoder will automatically fill the `latitude` and `longitude` fields.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  geocoded_by :full_address   # method or column to fetch address
  after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  def full_address
    [street, city, state, country].compact.join(', ')
  end
end
```