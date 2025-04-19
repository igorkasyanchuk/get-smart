## 🏗️ Nested Layouts with `content_for`
Rails allows nested layouts by yielding to named content blocks. You can define a base layout and then wrap it in more specialized layouts, passing content using `content_for`.

```erb
<!-- app/views/layouts/base.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title><%= yield(:title) || "MyApp" %></title>
</head>
<body>
  <%= yield %>
</body>
</html>

<!-- app/views/layouts/admin.html.erb -->
<% content_for :title, "Admin Area" %>
<%= render layout: "base" do %>
  <div class="admin-header">Admin Panel</div>
  <%= yield %>
<% end %>
```

In your controller, specify `layout "admin"`, and your views will be wrapped first by `admin.html.erb` and then by `base.html.erb`, allowing fine-grained layout composition.