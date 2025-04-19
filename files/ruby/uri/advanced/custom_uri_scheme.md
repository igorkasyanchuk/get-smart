## 🌐 Custom URI Scheme Handler
By subclassing `URI::Generic`, you can create custom URI schemes that integrate seamlessly with Ruby's `URI` module. This allows you to parse, validate, and manipulate non-standard URIs without resorting to manual regex hacks.

```ruby
require 'uri'

class URI::MyApp < URI::Generic
  def self.build(options = {})
    super(options.merge(scheme: 'myapp'))
  end
end

# Register the scheme so URI.parse recognizes it
URI.scheme_list['MYAPP'] = URI::MyApp

uri = URI.parse('myapp://user:pass@host:4567/path?foo=bar')
puts uri.scheme   # => "myapp"
puts uri.host     # => "host"
puts uri.user     # => "user"
```