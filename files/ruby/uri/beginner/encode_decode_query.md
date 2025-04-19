## 🔧 Encode and Decode Query Parameters

When sending or reading query parameters, use `URI.encode_www_form` to encode a hash into a URL-safe string, and `URI.decode_www_form` to convert it back into an array of pairs or a hash. This prevents issues with spaces or special characters. Example:

```ruby
require 'uri'

# Encoding parameters
params = { city: 'München', q: 'café' }
encoded = URI.encode_www_form(params)
puts encoded  #=> "city=M%C3%BCnchen&q=caf%C3%A9"

# Decoding back
decoded = URI.decode_www_form(encoded).to_h
puts decoded  #=> { "city" => "München", "q" => "café" }
```