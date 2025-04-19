## 🚀 Dynamically Overriding Partial Lookup Paths
For theming or multi-tenant apps, you can use `prepend_view_path` at runtime to override where Rails looks for partials. This lets you swap in tenant-specific views without changing your render calls, keeping your controller and view code clean.

```ruby
# app/controllers/application_controller.rb
before_action :set_tenant_view_path

def set_tenant_view_path
  if current_tenant&.theme
    prepend_view_path Rails.root.join("app/views/themes", current_tenant.theme)
  end
end
```

```erb
<%# Now rendering this will first look under app/views/themes/<theme>/shared/_header.html.erb %>
<%= render 'shared/header' %>
```