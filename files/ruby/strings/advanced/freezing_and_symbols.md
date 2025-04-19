## 🔒 Leverage Frozen String Literals for Efficiency

Enable `# frozen_string_literal: true` to intern all literals, reducing allocations and allowing safe reuse. Combine with converting frequently-seen strings to symbols for hash keys or lookups.

```ruby
# In your file header
# frozen_string_literal: true

def headers
  { "Content-Type" => "application/json" }
end

# Later, avoid string allocations
cache_key = :user_profile_cache
```
