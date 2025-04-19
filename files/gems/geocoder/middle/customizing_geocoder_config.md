## ⚙️ Customizing Geocoder Configuration and Caching

Tweaking Geocoder’s global settings helps optimize performance and control accuracy. You can change default units, timeout, and enable result caching.

1. Create or update `config/initializers/geocoder.rb`:

```ruby
Geocoder.configure(
  # Use kilometers instead of miles
  units: :km,
  # Limit network requests to one per second
  lookup: :google,
  api_key: ENV['GOOGLE_GEOCODER_API_KEY'],
  timeout: 5,
  # Store geocoding results in Redis to avoid repeated API calls
  cache: Geocoder::Store::Redis.new,
  cache_prefix: 'geocoder:'
)
```

2. Re‑geocode only when needed to reduce API usage:

```ruby
class Place < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode, if: :address_needs_geocoding?

  def address_needs_geocoding?
    address.present? && (latitude.blank? || address_changed?)
  end
end
```

With caching enabled and selective geocoding, you’ll minimize external requests and speed up lookup.