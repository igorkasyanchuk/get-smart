## 📂 Multiple User Scopes with Custom Sessions

When your app has multiple Devise models (e.g., `User` and `Admin`), isolate their sessions and routes to prevent conflicts and reuse controllers. Specify custom controllers and scope routes to customize behavior, redirects, and views per role.

```ruby
# config/routes.rb
devise_for :admins,
           controllers: { sessions: 'admins/sessions' }

devise_for :users
```

```ruby
# app/controllers/admins/sessions_controller.rb
class Admins::SessionsController < Devise::SessionsController
  # Redirect admins to dashboard
  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end
end
```

Customize user sessions independently:

```ruby
# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  layout 'public'
end
```