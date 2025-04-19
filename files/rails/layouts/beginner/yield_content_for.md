## 📑 Yield and `content_for` for Flexible Sections

Use `yield` to render the main content and `content_for` to define extra regions such as sidebars or page-specific scripts. This keeps your layout flexible and organized.

```erb
<!-- in application.html.erb -->
<body>
  <header>My Header</header>
  <aside><%= yield :sidebar %></aside>
  <main><%= yield %></main>
  <footer>My Footer</footer>
  <%= yield :scripts %>
</body>
```

```erb
<!-- in a view: app/views/posts/index.html.erb -->
<% content_for :sidebar do %>
  <p>Recent Posts</p>
<% end %>

<h1>All Posts</h1>
<!-- page content -->
```