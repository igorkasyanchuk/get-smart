## 🌐 Merge and Encode Query Parameters Dynamically

When calling endpoints that accept many optional filters, merge a set of default params with runtime options to keep calls consistent. HTTParty will automatically URI-encode the hash under the `query:` key. This approach avoids manually building query strings and handles special characters correctly.

```ruby
class SearchService
  include HTTParty
  base_uri 'https://api.example.com'

  DEFAULT_PARAMS = { per_page: 20, sort: 'name' }.freeze

  def search(query, options = {})
    params = DEFAULT_PARAMS.merge(options).merge(q: query)
    self.class.get('/search', query: params)
  end
end

# Usage:
service = SearchService.new
response = service.search('rails', page: 2, sort: 'date')
p response.parsed_response['results']
```