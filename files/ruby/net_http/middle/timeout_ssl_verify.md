## ⏱️ Custom Timeouts and SSL Verification

Improve reliability by configuring `open_timeout` and `read_timeout`, and enforce SSL verification to avoid MITM attacks. Specify a CA bundle if needed.

```ruby
require 'net/http'
require 'uri'
require 'openssl'

uri = URI('https://secure.example.com')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.open_timeout = 5    # seconds to open a connection
http.read_timeout = 10   # seconds to read data
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
http.ca_file = '/path/to/cacert.pem'

request = Net::HTTP::Get.new(uri)
response = http.request(request)
puts response.body
```