## 📋 Set Secure HTTP Headers
Add security-related headers to protect against common attacks. Configure default headers in an initializer.

```ruby
# config/initializers/secure_headers.rb
Rails.application.config.action_dispatch.default_headers = {
  'X-Frame-Options' => 'SAMEORIGIN',
  'X-XSS-Protection' => '1; mode=block',
  'X-Content-Type-Options' => 'nosniff'
}
```