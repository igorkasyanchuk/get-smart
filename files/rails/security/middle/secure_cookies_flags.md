## 🔏 Secure Cookie Flags Enhance Session Security

Set `secure: true` and `httponly: true` on cookies to prevent access via JavaScript and enforce HTTPS transmission.

```ruby
Rails.application.config.session_store :cookie_store, key: '_app_session', secure: Rails.env.production?, httponly: true
```