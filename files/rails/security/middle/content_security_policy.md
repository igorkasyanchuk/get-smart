## 🛡️ Implement Content Security Policy (CSP) in Rails
CSP helps mitigate Cross-Site Scripting (XSS) attacks by restricting resources the browser can load.

Add CSP configuration in `config/initializers/content_security_policy.rb`:

```ruby
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https
  policy.style_src   :self, :https
  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end
```

This setup reduces risk of loading malicious scripts.