## 🔐 Harden Turbo JS with CSP and Nonces
To maintain security under Content Security Policy, generate nonces on each request and pass them to Turbo Stream templates. This prevents inline script injection.

```ruby
# app/controllers/application_controller.rb
before_action :set_nonce

def set_nonce
  request.env["action_dispatch.content_security_policy_nonce"] = SecureRandom.base64(16)
end
```

```erb
<turbo-stream action="append" target="console" nonce="<%= content_security_policy_nonce %>">
  <template>
    <script nonce="<%= content_security_policy_nonce %>">console.log('Safe');</script>
  </template>
</turbo-stream>
```