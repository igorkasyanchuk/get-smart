## 🛰️ Enable Content Security Policy (CSP)
Mitigate XSS by specifying allowed sources for scripts and styles. Define a basic CSP in an initializer.

```ruby
# config/initializers/content_security_policy.rb
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.script_src  :self, 'https://trusted.cdn.com'
  policy.style_src   :self
end
```
