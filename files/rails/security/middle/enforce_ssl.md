## 🚧 Enforce SSL/TLS in Production

Force secure connections by redirecting HTTP to HTTPS and setting HSTS headers.

```ruby
# config/environments/production.rb
config.force_ssl = true
# This enables HSTS and ensures all requests use SSL
```
