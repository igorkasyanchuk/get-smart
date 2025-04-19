## 🧩 Compose Layouts with Nested Partials

Break your layout into partials like `_header.html.erb` and `_footer.html.erb`. This makes maintenance easier and promotes reuse across different layouts.

```erb
<!-- app/views/layouts/application.html.erb -->
<html>
  <head>
    <%= render 'layouts/header' %>
  </head>
  <body>
    <%= yield %>
    <%= render 'layouts/footer' %>
  </body>
</html>
```

```erb
<!-- app/views/layouts/_header.html.erb -->
<header>
  <h1>MyApp</h1>
</header>
```