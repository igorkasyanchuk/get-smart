## 🚨 HTTP Strict Transport Security (HSTS)

Enforce HTTPS by setting HSTS headers, preventing protocol downgrade attacks. Customize the `max-age`, subdomains, and preload directives.

```ruby
# config/initializers/force_ssl.rb
Rails.application.config.ssl_options = {
  hsts: {
    expires: 1.year,
    subdomains: true,
    preload: true
  }
}
```