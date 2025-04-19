## 🔄 Customize Post-Login Redirects

When using Devise, you can override `after_sign_in_path_for` to redirect users based on their roles or preferences. This ensures admins land on a dashboard while regular users go to the homepage. Simply add the override in `ApplicationController` or a custom sessions controller.

```ruby
class ApplicationController < ActionController::Base
  # Redirect users after login based on role
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      root_path
    end
  end
end
```