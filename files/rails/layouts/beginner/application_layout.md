## 🎨 Use the `application.html.erb` Layout

Rails uses `app/views/layouts/application.html.erb` by default to wrap all views. You can customize your site’s global HTML structure and include assets here so every page inherits the same header, footer, and stylesheet links.

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
    <%= yield %>
  </body>
</html>
```
