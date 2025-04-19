## 🎯 Advanced `content_for` with Multiple Yields and Defaults
Define multiple named yield regions in your layout and supply fallbacks for missing content. This pattern lets you build flexible pages with optional slots.

In `app/views/layouts/application.html.erb`:

```erb
<!DOCTYPE html>
<html>
<head>
  <%= yield :head %>
  <%= stylesheet_link_tag 'application', media: 'all' %>
</head>
<body>
  <aside class="sidebar">
    <%= yield :sidebar || render('shared/default_sidebar') %>
  </aside>

  <section class="main">
    <%= yield %>
  </section>

  <%= yield :scripts %>
</body>
</html>
```

Then in a view, populate only what you need:

```erb
<% content_for :head do %>
  <%= javascript_include_tag 'charts' %>
<% end %>

<% content_for :sidebar do %>
  <%= render 'dashboard/custom_sidebar', user: current_user %>
<% end %>

<% content_for :scripts do %>
  <script>initializeDashboard();</script>
<% end %>

<h1>Welcome back, <%= current_user.name %>!</h1>
```