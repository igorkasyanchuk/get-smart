## 🎩 Implement Simple Role-Based Authorization

For basic authorization, add a `role` attribute to your `User` model and check it in controllers or views. This allows granting admin or other privileges easily.

1. Add `role` to users (e.g., `:user` or `:admin`):

```bash
rails generate migration AddRoleToUsers role:string
rails db:migrate
```

2. Set a default role in the model:

```ruby
class User < ApplicationRecord
  has_secure_password
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= 'user'
  end

  def admin?
    role == 'admin'
  end
end
```

3. Restrict access in controllers:

```ruby
class Admin::DashboardController < ApplicationController
  before_action :require_login
  before_action :require_admin

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied' unless current_user&.admin?
  end
end
```