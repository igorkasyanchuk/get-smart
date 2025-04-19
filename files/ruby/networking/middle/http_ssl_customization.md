## 🔒 Customize SSL Settings in Net::HTTP

When communicating over HTTPS, you may need to verify certificates, use custom CA bundles, or disable hostname verification in development. Net::HTTP allows full control over the SSL context so you can tweak ciphers, verify modes, and certificate stores to match your security requirements.

```ruby
require 'net/http'

uri = URI('https://secure.example.com')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
http.ca_file = '/path/to/ca_bundle.crt'
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE # disable only in local dev

request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
puts response.code, response.body
```