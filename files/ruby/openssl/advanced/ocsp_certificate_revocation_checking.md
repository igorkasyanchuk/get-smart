## 🔍 OCSP Revocation Checking in Ruby
Rather than relying solely on CRLs, you can perform on‑the‑fly OCSP queries to the issuer’s responder to verify a certificate’s revocation status. This is crucial for systems requiring real‑time assurance of peer identities. Ruby lets you craft and parse OCSP requests, then integrate results into your SSLContext handshake or custom validation logic.

```ruby
require 'openssl'

cert = OpenSSL::X509::Certificate.new(File.read('peer.crt'))
issuer = OpenSSL::X509::Certificate.new(File.read('issuer.crt'))
ocsp_uri = cert.extensions.detect { |e| e.oid == 'authorityInfoAccess' }
  .value[/OCSP - URI:(\S+)/, 1]

# Build OCSP request
request = OpenSSL::OCSP::Request.new
request.add_cert(cert, issuer, OpenSSL::Digest::SHA1.new)

# Send via HTTP
http = Net::HTTP.new(URI(ocsp_uri).host)
resp = http.post(URI(ocsp_uri).request_uri, request.to_der,
                 'Content-Type' => 'application/ocsp-request')

# Parse and interpret response
ocsp_resp = OpenSSL::OCSP::Response.new(resp.body)
status = ocsp_resp.basic_status.first.status
puts status == OpenSSL::OCSP::V_OK ? 'Certificate is good' : 'Revoked or unknown'
```