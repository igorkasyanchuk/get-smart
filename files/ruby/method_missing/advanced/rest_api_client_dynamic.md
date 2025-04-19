## 🌐 Generate REST API Clients Dynamically

Use `method_missing` to map arbitrary method names to HTTP verbs or endpoints on remote services. Combine with `respond_to_missing?` for introspection-friendly clients.

```ruby
require 'net/http'

class ApiClient
  BASE = URI('https://api.example.com')

  def method_missing(name, *args, &block)
    http_method, resource = name.to_s.split('_', 2)
    if %w[get post put delete].include?(http_method)
      uri = BASE + "/#{resource}"
      request = Net::HTTP.const_get(http_method.capitalize).new(uri)
      request.body = args.first.to_json if args.first
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |h| h.request(request) }
      JSON.parse(response.body)
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    http_method = name.to_s.split('_', 2).first
    %w[get post put delete].include?(http_method) || super
  end
end

client = ApiClient.new
client.get_users      # GET https://api.example.com/users
client.post_orders({ product_id: 1, qty: 2 })
```