## 🔎 Performing Nearby Searches with the `near` Scope

Geocoder provides a `near` scope that makes location-based queries effortless. You can find records within a certain distance or order them by proximity.

```ruby
# Find users within 10 miles of a given point
nearby_users = User.near([40.7128, -74.0060], 10)

# Find addresses near a string address, ordered by distance
nearby_restaurants = Restaurant.near("1600 Pennsylvania Ave NW, Washington, DC", 5, units: :mi)
```

Options:
- `units`: `:mi` or `:km` (defaults to `:mi`)
- `order`: set to `false` to avoid automatic distance ordering
- `limit`: chain `limit(n)` to restrict results

```ruby
# Customize units and disable ordering
fast_search = Location.near("Paris, France", 50, units: :km, order: false)
limit_results = fast_search.limit(20)
```