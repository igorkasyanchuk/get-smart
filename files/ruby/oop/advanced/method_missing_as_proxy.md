## 🛠️ Build Lightweight Proxies with `method_missing`
Intercept calls to undefined methods and delegate them dynamically. This technique can power API wrappers, building proxies without boilerplate for every method.

```ruby
class ApiClient
  BASE_URL = 'https://api.example.com/'

  def initialize(resource)
    @resource = resource
  end

  def method_missing(name, *args)
    if args.first.is_a?(Hash)
      query = URI.encode_www_form(args.first)
      get("#{@resource}/#{name}?#{query}")
    else
      super
    end
  end

  def respond_to_missing?(name, _)
    true
  end

  private

def get(path)
    # HTTP GET logic using Net::HTTP or Faraday
  end
end

client = ApiClient.new('users')
client.find(id: 1)
```