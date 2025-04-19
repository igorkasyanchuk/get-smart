## 🚀 Add HTTP Security Headers

Add headers like `X-Content-Type-Options`, `X-XSS-Protection`, and `Referrer-Policy` to strengthen security.

```ruby
# config/application.rb
config.action_dispatch.default_headers.merge!({
  'X-Content-Type-Options' => 'nosniff',
  'X-XSS-Protection' => '1; mode=block',
  'Referrer-Policy' => 'strict-origin-when-cross-origin'
})
```
