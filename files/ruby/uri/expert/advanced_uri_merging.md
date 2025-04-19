## 🔄 Advanced URI Merging and Query Composition

Ruby's `URI#merge` can intelligently combine base and relative URIs, but complex query params (arrays, nested) require manual normalization. Use `URI.encode_www_form` to build query strings and assign them directly for precise control over parameter ordering and encoding.

```ruby
require 'uri'

base = URI('https://example.com/api/v2/resources/')
# Relative path and raw query parameters
sub   = '../profiles?id=42&tags[]=ruby&tags[]=uri'
merged = base.merge(sub)
# merged => #<URI::HTTPS https://example.com/api/v2/profiles?id=42&tags%5B%5D=ruby&tags%5B%5D=uri>

# Rebuild query for custom ordering or complex structures
params = { 'id' => 42, 'tags[]' => ['ruby', 'uri'], 'filter[active]' => true }
merged.query = URI.encode_www_form(params)
# => "id=42&tags%5B%5D=ruby&tags%5B%5D=uri&filter%5Bactive%5D=true"

puts merged.to_s
# https://example.com/api/v2/profiles?id=42&tags%5B%5D=ruby&tags%5B%5D=uri&filter%5Bactive%5D=true
```