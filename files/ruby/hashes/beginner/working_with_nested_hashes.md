## 🏗️ Working with Nested Hashes
Hashes can contain other hashes, allowing you to build complex data structures. Access nested values by chaining key lookups or using the dig method for safety.

```ruby
config = {
  database: {
    adapter: "sqlite3",
    pool: 5
  }
}
# Chained lookup
adapter = config[:database][:adapter]  # => "sqlite3"

# Safe lookup
timeout = config.dig(:database, :timeout) || 5000  # fallback default
```