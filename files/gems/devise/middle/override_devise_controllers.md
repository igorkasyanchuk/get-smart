## 🛠️ Override Devise Controllers for Custom Logic

Sometimes you need to tweak Devise behaviors (e.g., skip password requirement on email-only updates). Subclass the built‑in controller and update your routes to point at it.

```ruby
# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # Allow users to update non-sensitive fields without password
  def update_resource(resource, params)
    if params[:email].blank? && params[:username]
      resource.update_without_password(params)
    else
      super
    end
  end
end

# config/routes.rb
devise_for :users, controllers: { registrations: 'users/registrations' }
```