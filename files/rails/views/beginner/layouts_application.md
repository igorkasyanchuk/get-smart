## 🎨 Use Layouts to DRY Your Views

Layouts allow you to define a common structure for multiple views, keeping your HTML DRY. By default, `app/views/layouts/application.html.erb` wraps every view in your app. Use `<%= yield %>` to inject view-specific content into the layout.

```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <title>MyApp</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag 'application', media: 'all' %>
  </head>
  <body>
    <header>
      <h1>MyApp Header</h1>
    </header>

    <main>
      <%= yield %>
    </main>

    <footer>
      <p>&copy; 2024 MyApp</p>
    </footer>
  </body>
</html>
```