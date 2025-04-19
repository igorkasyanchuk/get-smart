## 🛠 Building Custom URI Schemes via Subclassing

For proprietary or uncommon schemes, subclass `URI::Generic` and register it with `URI.scheme_list`. This allows `URI()` to parse new schemes into rich objects, preserving all components (userinfo, host, port, path, query, fragment) and enabling custom behavior.

```ruby
require 'uri'

class FooURI < URI::Generic
  DEFAULT_PORT = 12345
  # Define component hierarchy
  COMPONENT = %i[scheme userinfo host port registry path query fragment]

  def resource_id
    # Extract an ID from path like /resource/123
    path.split('/').last.to_i
  end
end

# Register new scheme
URI.scheme_list['foo'] = FooURI

# Parse a foo URI
u = URI('foo://alice:secret@host.com/resource/123?mode=fast#section')
puts u.class           # => FooURI
puts u.resource_id     # => 123
puts u.port            # => 12345 (default)
```