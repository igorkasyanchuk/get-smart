## 🗂 Perform Multipart File Uploads with Net::HTTP

Uploading files (images, forms) requires setting up a multipart boundary and encoding the body correctly. Net::HTTP doesn’t provide high‑level multipart helpers, so you build the payload manually or use the `multipart-post` gem for convenience.

```ruby
require 'net/http'
require 'uri'
require 'securerandom'

uri = URI('https://api.example.com/upload')
boundary = SecureRandom.hex(16)
post_body = []
post_body << "--#{boundary}\r\n"
post_body << "Content-Disposition: form-data; name=\"file\"; filename=\"photo.jpg\"\r\n"
post_body << "Content-Type: image/jpeg\r\n\r\n"
post_body << File.binread('photo.jpg')
post_body << "\r\n--#{boundary}--\r\n"

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri)
request['Content-Type'] = "multipart/form-data; boundary=#{boundary}"
request.body = post_body.join

response = http.request(request)
puts response.code, response.body
```