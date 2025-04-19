## ⚙️ Leverage a PKCS#11 Engine for Hardware-Backed Keys

Offloading cryptographic operations to an HSM or smartcard can drastically improve security by keeping private keys off your server. Ruby’s OpenSSL supports loading custom engines via PKCS#11 to perform signing and decryption operations.

```ruby
require 'openssl'

# Load the PKCS#11 engine
engine = OpenSSL::Engine.by_id('pkcs11')
engine.ctrl_cmd_string('MODULE_PATH', '/usr/lib/your-pkcs11.so')
engine.init

# Use the engine to load a private key by label
priv_key = OpenSSL::PKey::EC.new(engine.load_private_key('label=ServerKey;pin-value=1234'))

# Sign data using the HSM-backed key
data = 'critical payload'
sig = priv_key.dsa_sign_asn1(data)
puts "Signature (Base64): #{[sig].pack('m0')}"

# Clean up
engine.finish
```