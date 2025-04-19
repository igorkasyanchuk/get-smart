## 🚀 Generate API Clients from Spec with define_method

When building clients for REST APIs, you can load an external spec (YAML/JSON) and dynamically define endpoint methods. This keeps your client DRY and in sync with the spec, automatically handling path interpolation and HTTP verbs.

```ruby
require 'yaml'
require 'net/http'

spec = YAML.load_file('api_spec.yml')

class ApiClient
  spec['endpoints'].each do |name, cfg|
    define_method(name) do |params = {}|
      path = cfg['path'].gsub(/:\w+/) { |m| params[m[1..-1].to_sym] }
      uri  = URI.parse("#{cfg['base_url']}#{path}")
      req  = Net::HTTP.const_get(cfg['method'].capitalize).new(uri)
      req.body = params[:body].to_json if params[:body]
      Net::HTTP.start(uri.host, uri.port) { |http| http.request(req) }
    end
  end
end

client = ApiClient.new
client.get_user(id: 42)
```