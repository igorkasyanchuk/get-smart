## 🛡 Use Content Security Policy (CSP) to Mitigate XSS

Configure CSP headers to restrict sources of scripts and styles.

```ruby
# config/initializers/content_security_policy.rb
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.script_src  :self, :https
  policy.style_src   :self, :https
end
```