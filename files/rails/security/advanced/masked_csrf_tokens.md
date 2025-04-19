## 🛡️ Use Masked CSRF Tokens

Rails 5.2+ implements masked CSRF tokens to prevent BREACH attacks. Ensure your application uses the default masked tokens and avoid disabling them.

```ruby
# Verify in ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
```

No additional code is needed, but ensure you do not override `form_authenticity_token` with unmasked values.