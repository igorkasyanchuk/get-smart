## 🔄 Transforming Hash Keys and Values

Ruby’s `transform_keys` and `transform_values` let you map over a hash’s structure without converting to arrays. These methods return new hashes, keeping the original intact.

```ruby
metrics = { "load time" => 3.5, "uptime" => 99.9 }

# Normalize keys to symbols:
symbolized = metrics.transform_keys { |k| k.tr(" ", "_").to_sym }
# => { load_time: 3.5, uptime: 99.9 }

# Convert values to integers:
rounded = metrics.transform_values(&:to_i)
# => { "load time" => 3, "uptime" => 99 }
```