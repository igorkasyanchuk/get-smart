## 🏷️ Tip: Use Named Slots with `content_for` and `yield`
Leverage `content_for` with named keys to inject dynamic content into layout regions or nested partials. This allows more flexible placement compared to single `yield`.

Example:

```erb
<%# app/views/layouts/application.html.erb %>
<html>
<head>
  <%= yield :head %>
</head>
<body>
  <%= yield %>
  <footer><%= yield :footer %></footer>
</body>
</html>
```
```erb
<%# app/views/posts/show.html.erb %>
<% content_for :head do %>
  <link rel="stylesheet" href="/styles/posts.css">
<% end %>

<h1><%= @post.title %></h1>
<p><%= @post.body %></p>

<% content_for :footer do %>
  <p>© 2024 Blog</p>
<% end %>
```