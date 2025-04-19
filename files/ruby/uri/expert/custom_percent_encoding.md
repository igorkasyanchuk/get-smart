## 🔧 Custom Percent-Encoding with URI::Parser

To handle non-standard reserved characters or preserve literals like square brackets and spaces, instantiate a custom URI::Parser. By overriding the UNRESERVED set, you can precisely control which characters are percent-encoded and decoded, avoiding double-encoding or unexpected escapes.

```ruby
require 'uri'
# Extend default UNRESERVED to include square brackets
custom_parser = URI::Parser.new(
  UNRESERVED: URI::Parser::UNRESERVED + '[]'
)

raw_uri = 'http://api.example.com/resource/my path/[detail]?q=foo bar'
escaped  = custom_parser.escape(raw_uri)
# => "http://api.example.com/resource/my%20path/%5Bdetail%5D?q=foo%20bar"

decoded = custom_parser.unescape(escaped)
# => returns original raw_uri
```