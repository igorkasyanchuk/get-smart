## 📜 Verifying X.509 Certificate Chain

When connecting to TLS services or parsing certificates, you must verify trust chains. `OpenSSL::X509::Store` lets you load CAs and verify a peer certificate.

```ruby
require 'openssl'

# Load root CAs
store = OpenSSL::X509::Store.new
store.set_default_paths
# Optionally add a custom CA
store.add_file('/path/to/your/ca_cert.pem')

# Load peer certificate and any intermediates
cert = OpenSSL::X509::Certificate.new(File.read('server_cert.pem'))
chain = [OpenSSL::X509::Certificate.new(File.read('intermediate.pem'))]

# Verify
begin
  store.verify(cert, chain)
  puts 'Certificate is valid and trusted.'
rescue OpenSSL::X509::StoreError => e
  warn "Verification failed: #{e.message}"
end
```