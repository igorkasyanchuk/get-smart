## 🍪 Secure Cookies Configuration

Configure session cookies with `secure` and `httponly` flags to protect cookies in transit and mitigate XSS.

```ruby
# config/initializers/session_store.rb
Rails.application.config.session_store :cookie_store, key: '_app_session', secure: Rails.env.production?, httponly: true, same_site: :lax
```
