## 🧭 Enable CSRF Protection to Prevent Cross-Site Request Forgery

Rails has built-in CSRF protection enabled by default. Ensure your controllers have:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
```

This adds security tokens to forms and verifies on submission.