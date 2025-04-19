## 🔄 Customize Redirect After Sign-In

Users often need to land on different pages after logging in (e.g., a dashboard or onboarding flow). Override `after_sign_in_path_for` in your `ApplicationController` to handle custom logic based on user roles or stored locations.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    return admin_dashboard_path if resource.admin?
    stored_location_for(resource) || user_dashboard_path
  end
end
```
