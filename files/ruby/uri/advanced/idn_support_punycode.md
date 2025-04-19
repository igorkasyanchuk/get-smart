## 🚀 Handling Internationalized Domain Names (IDNs)
Ruby's `URI` doesn’t convert Unicode domains to punycode out of the box. Integrate the `simpleidn` gem to transparently handle IDNs and ensure your URIs remain valid across DNS and HTTP clients.

```ruby
# Add to your Gemfile:
# gem 'simpleidn'

gem install simpleidn
require 'uri'
require 'simpleidn'

raw_uri = 'https://例え.テスト/path'
parsed  = URI.parse(raw_uri)
# Convert Unicode host to ASCII-compatible encoding (ACE)
ace_host = SimpleIDN.to_ascii(parsed.host)
parsed.host = ace_host

puts parsed.to_s
# => "https://xn--r8jz45g.xn--zckzah/path"
```