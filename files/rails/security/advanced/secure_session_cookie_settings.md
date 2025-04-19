## 🍪 Secure Session Cookie Configuration

Harden session cookies with `SameSite`, `secure`, and custom domains. This mitigates CSRF and session hijacking.

```ruby
# config/initializers/session_store.rb
Rails.application.config.session_store :cookie_store, key: '_app_session', 
                                                     secure: Rails.env.production?,
                                                     httponly: true,
                                                     same_site: :strict,
                                                     domain: :all
```