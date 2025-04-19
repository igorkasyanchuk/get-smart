## 🔍 Using `fetch` with Default Values

When retrieving values from a hash, `fetch` allows you to provide a default (or a block) to handle missing keys gracefully. This is handy when you want to raise a custom error or compute a fallback value on-the-fly.

For example, using a static default:

```ruby
settings = { timeout: 5 }
# returns 5
settings.fetch(:timeout, 10)
# returns 10 because :retry_count is missing
settings.fetch(:retry_count, 3)
```

Or using a block to compute the default:

```ruby
user_data = {}
def_name = ->(key) { "No value for #{key}" }
puts user_data.fetch(:name, &def_name)
# => "No value for name"
```