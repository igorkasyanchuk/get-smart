## 🔑 Implementing PKCE in OAuth Flows

Enhance your OAuth authorization by using PKCE (Proof Key for Code Exchange). This adds a code verifier and code challenge to the flow.

```ruby
# Generate code verifier and challenge
code_verifier = SecureRandom.urlsafe_base64(64)
s256 = Digest::SHA256.digest(code_verifier)
code_challenge = Base64.urlsafe_encode64(s256).delete("=")

# Redirect user to auth
redirect_to oauth_authorize_url(
  client_id: ENV['CLIENT_ID'],
  code_challenge: code_challenge,
  code_challenge_method: 'S256'
)
```