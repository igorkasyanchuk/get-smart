## 🔐 Customize SSL Context for Enhanced Security

Net::HTTP allows you to configure an OpenSSL `SSLContext` to enforce specific ciphers, set custom certificate authorities, or present client certificates. This is crucial for mutual TLS setups and complying with strict security policies.

```ruby
require 'openssl'
uri = URI('https://secure.example.com')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
context = OpenSSL::SSL::SSLContext.new
context.verify_mode = OpenSSL::SSL::VERIFY_PEER
context.ca_file = '/etc/ssl/certs/ca-bundle.crt'
context.key = OpenSSL::PKey::RSA.new(File.read('client.key'))
context.cert = OpenSSL::X509::Certificate.new(File.read('client.crt'))
http.ssl_version = :TLSv1_2
http.ssl_timeout = 5
http.start { |h| puts h.get(uri.request_uri).body }
```