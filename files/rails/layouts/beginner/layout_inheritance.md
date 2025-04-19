## 🔄 Fallback Content with `provide` and Default `yield`

Use `provide` to set default values for `content_for` slots and then fallback to `yield`. If a view doesn’t override a section, the layout’s default will appear.

```erb
<!-- app/views/layouts/application.html.erb -->
<head>
  <title><%= content_for?(:title) ? yield(:title) : 'MyApp Default Title' %></title>
</head>
<body>
  <h1><%= yield(:title) || 'Welcome!' %></h1>
  <%= yield %>
</body>
</html>
```

```erb
<!-- in a view without title: app/views/home/index.html.erb -->
<p>This view doesn’t set a title, so layout defaults are used.</p>
```