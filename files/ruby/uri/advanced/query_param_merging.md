## 🔍 Merging Query Parameters Efficiently
When you need to add, update, or remove parameters without breaking existing queries, use `URI.decode_www_form` and `URI.encode_www_form`. This approach handles URL-encoding correctly and preserves parameter order when necessary.

```ruby
require 'uri'

uri = URI.parse('https://example.com/search?term=ruby&page=2')
params = URI.decode_www_form(uri.query || '')
# Convert to hash-like structure
param_hash = params.to_h
param_hash['page'] = '3'          # update existing
param_hash['lang'] = 'en'         # add new
param_hash.delete('term')         # remove key

# Reassign and re-encode
uri.query = URI.encode_www_form(param_hash)
puts uri.to_s
# => "https://example.com/search?page=3&lang=en"
```