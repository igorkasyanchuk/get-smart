## 🛠 Constructing URIs with Proper Encoding

Use `URI::Generic.build` (or specific subclasses like `URI::HTTP.build`) to programmatically assemble URI components, ensuring proper percent‑encoding of path segments and query parameters. Always encode dynamic segments to avoid invalid URLs or injection issues.

```ruby
require 'uri'

base = 'https://example.com'
search_term = 'Café & Restaurant'

uri = URI::HTTP.build(
  host: 'example.com',
  path: '/search',
  query: URI.encode_www_form(q: search_term, page: 1)
)

puts uri.to_s
# => "https://example.com/search?q=Caf%C3%A9+%26+Restaurant&page=1"
```