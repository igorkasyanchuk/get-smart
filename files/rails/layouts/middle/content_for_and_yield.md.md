## 🎨 Structuring Sections with content_for and yield

Use `content_for` in your views to define named blocks that your layout can render with `yield`. This helps you inject scripts, styles, or sidebar content into specific layout regions without cluttering your view files.

```erb
<!-- app/views/articles/show.html.erb -->
<% content_for :sidebar do %>
  <%= render 'articles/related', related: @related_articles %>
<% end %>

<h1><%= @article.title %></h1>
<p><%= @article.body %></p>
```

```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title>MyApp</title>
  <%= csrf_meta_tags %>
  <%= stylesheet_link_tag 'application', media: 'all' %>
  <%= yield :head %>
</head>
<body>
  <div class="sidebar"><%= yield :sidebar %></div>
  <div class="content"><%= yield %></div>
  <%= yield :scripts %>
</body>
</html>
```