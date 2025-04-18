## 🔐 Use `secure_headers` Gem for Advanced Security Headers
Add the `secure_headers` gem to easily manage HTTP security headers like HSTS, X-Frame-Options, and others.

```ruby
# Gemfile
gem 'secure_headers'

# In ApplicationController
class ApplicationController < ActionController::Base
  ensure_security_headers
end

# Configuring headers
SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=31536000; includeSubdomains"
  config.x_frame_options = "SAMEORIGIN"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
end
```

These headers protect against common HTTP attacks.