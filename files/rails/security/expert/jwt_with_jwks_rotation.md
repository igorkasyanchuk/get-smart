## 🔑 JWT Verification with JWKS & Key Rotation
Use JWKS to fetch rotating RSA public keys. This pattern lets you seamlessly rotate signing keys without downtime or manual credential updates.

```ruby
# app/services/jwt_service.rb
require 'jwt'

class JwtService
  JWKS_URI = 'https://auth.example.com/.well-known/jwks.json'

  def self.decode(token)
    jwks = JSON.parse(HTTP.get(JWKS_URI).body.to_s)['keys']
    JWT.decode(token, nil, true,
      algorithms: ['RS256'],
      jwks: jwks,
      jwks_verify: ->(header, jwk_set) {
        jwk = jwk_set.find { |k| k['kid'] == header['kid'] }
        raise JWT::VerificationError unless jwk
        JWT::JWK.import(jwk).public_key
      }
    )
  end
end
```

This fetches the current key set at runtime and picks the right one via `kid`, supporting seamless key rollovers.
