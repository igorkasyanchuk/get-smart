## 🔒 Secure Session Settings
Configure session cookies to be secure, HTTP-only, and use SameSite attributes to prevent session hijacking.

In `config/initializers/session_store.rb`:

```ruby
Rails.application.config.session_store :cookie_store, key: '_your_app_session', secure: Rails.env.production?, httponly: true, same_site: :lax
```

- `secure: true` forces cookies over HTTPS.
- `httponly: true` disables JavaScript access.
- `same_site: :lax` blocks some cross-site request forgery attempts.