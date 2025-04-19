## 🔀 Merging and Resolving Relative URIs

Ruby’s `URI` library can resolve relative paths against a base URI using `URI#merge` or the `URI.join` helper. This is handy for assembling endpoints or navigating through API link relations without manual string concatenation.

```ruby
require 'uri'

base = URI('https://api.example.com/v1/')
# Using merge
full = base.merge('users/123?include=details')
puts full.to_s
# => "https://api.example.com/v1/users/123?include=details"

# Using join (handles leading/trailing slashes)
joined = URI.join('https://api.example.com/v1', '/projects/456/')
puts joined.to_s
# => "https://api.example.com/v1/projects/456/"
```