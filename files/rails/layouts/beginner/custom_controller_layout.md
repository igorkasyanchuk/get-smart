## 🛠️ Set a Custom Layout in Your Controller

You can specify a different layout for a controller using `layout :name`. This is handy for admin panels or API responses that need a unique wrapper.

```ruby
# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < Admin::BaseController
  layout 'admin'

  def index
    # renders app/views/admin/dashboard/index.html.erb inside layouts/admin.html.erb
  end
end
```

```erb
<!-- app/views/layouts/admin.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title>Admin Panel</title>
</head>
<body>
  <%= yield %>
</body>
</html>
```