## 🌐 Implement Content Security Policy

Define a strict CSP to mitigate XSS and data injection. Use Rails built-in CSP DSL in `application_controller.rb`.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  content_security_policy do |policy|
    policy.default_src :self
    policy.script_src  :self, :https
    policy.style_src   :self, :https
  end
end
```
