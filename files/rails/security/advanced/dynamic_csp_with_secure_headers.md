## 📜 Dynamic Content Security Policy with SecureHeaders

Use the `secure_headers` gem to define and adjust CSP at runtime. You can whitelist dynamic asset hosts or nonces per-request.

```ruby
gem 'secure_headers'
```

```ruby
# config/initializers/secure_headers.rb
SecureHeaders::Configuration.default do |config|
  config.csp = {
    default_src: %w('self'),
    script_src: %w('self' 'unsafe-inline'),
    report_uri: %w(/csp-violation-report)
  }
end
```

```ruby
# In controller
SecureHeaders.override_x_content_security_policy(request) do |policy|
  policy.script_src += ["https://#{current_user.cdn_host}"]
end
```