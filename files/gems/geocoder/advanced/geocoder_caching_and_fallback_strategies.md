## 🛢️ Implementing Caching and Fallback Strategies

For high‑volume geocoding or reverse lookups, caching responses in Redis reduces API calls and costs. Configure Geocoder to use Redis and fall back between services:

```ruby
# config/initializers/geocoder.rb
Geocoder.configure(
  timeout: 5,
  lookup: :google,
  api_key: ENV['GOOGLE_GEOCODING_API_KEY'],
  cache: Redis.new(url: ENV['REDIS_URL']),
  cache_prefix: 'geocoder:',
  use_https: true,
  always_raise: [Geocoder::OverQueryLimitError, Geocoder::RequestDenied],
  lookup_cache: {
    fallback: :nominatim,
    nominatim: {
      host: 'nominatim.openstreetmap.org',
      format: 'json'
    }
  }
)
```

With this setup, Geocoder will:

1. Attempt the Google API and cache the result under `geocoder:...` in Redis.  
2. On quota errors or timeouts, automatically retry using OpenStreetMap’s Nominatim.  

You can then safely call:

```ruby
coords = Geocoder.coordinates('1600 Amphitheatre Parkway, Mountain View, CA')
```