## 🔧 Permit Extra Parameters

Devise by default filters out any parameters it doesn’t recognize. If you need to accept custom attributes (like `username` or `avatar`), you can use the built‑in parameter sanitizer in your `ApplicationController`. This ensures your additional data is persisted correctly during sign up and account updates.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
```
