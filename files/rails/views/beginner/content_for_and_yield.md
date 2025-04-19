## 🧩 Use `content_for` and `yield` for Named Sections

`content_for` lets you set content for a named block in your layout, such as a page title or sidebar. Then `yield` the named block in your layout.

```erb
<!-- app/views/layouts/application.html.erb -->
<head>
  <title><%= yield :title %> | MyApp</title>
</head>

<!-- app/views/articles/show.html.erb -->
<% content_for :title do %>
  <%= @article.title %>
<% end %>

<article>
  <%= @article.body %>
</article>
```