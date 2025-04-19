## 🚀 Nested Layout Inheritance for Namespaced Views
Leverage nested layouts by having your namespaced layout wrap the application layout at runtime. This avoids duplication of common markup while adding specialized regions for your namespace.

In `app/views/layouts/application.html.erb`, define a placeholder for the inner body:

```erb
<!DOCTYPE html>
<html>
<head>
  <title>MyApp</title>
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
</head>
<body>
  <%= yield :inner_body %>
</body>
</html>
```

Then in `app/views/layouts/admin.html.erb`, render the application layout and inject your admin-specific content:

```erb
<%= render template: "layouts/application", locals: { inner_body: capture do %>
  <%= render "shared/admin_nav" %>
  <section class="admin-content">
    <%= yield %>
  </section>
<% end } %>
```

Now all controllers in the `Admin` namespace can simply use `layout "admin"`, and they’ll inherit the base HTML shell while adding the admin navigation and wrapper.