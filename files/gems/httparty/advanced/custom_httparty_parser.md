## 🚀 Custom Response Parser for HTTParty

HTTParty allows you to override its default parsers to handle non-standard APIs or convert response keys to your preferred format. By defining a custom parser, you can automatically transform snake_case keys to camelCase (or vice versa), strip unwanted metadata, or parse unusual content types.

```ruby
require 'httparty'

class CustomParser
  def self.call(body, format)
    json = JSON.parse(body)
    # Convert all keys to snake_case
    transform_keys = ->(obj) do
      case obj
      when Array
        obj.map(&transform_keys)
      when Hash
        obj.each_with_object({}) do |(k, v), memo|
          new_key = k.gsub(/([A-Z])/, '_\\1').downcase
          memo[new_key] = transform_keys.call(v)
        end
      else
        obj
      end
    end
    transform_keys.call(json)
  end
end

class MyClient
  include HTTParty
  base_uri 'https://api.example.com'
  parser CustomParser

  def fetch_data
    self.class.get('/data.json')
  end
end

client = MyClient.new
p client.fetch_data # => keys are now snake_case
```