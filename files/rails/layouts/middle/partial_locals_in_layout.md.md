## ⚙️ Passing Locals to Layout Partials

Enhance reusability by rendering partials in your layout and passing locals. This keeps your layout slim and delegates logic or markup details to partials.

```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <%= csrf_meta_tags %>
  <%= yield :head %>
</head>
<body>
  <%= render 'shared/header', user: current_user %>
  <div class="container">
    <%= yield %>
  </div>
  <%= render 'shared/footer', year: Time.current.year %>
</body>
</html>
```

```erb
<!-- app/views/shared/footer.html.erb -->
<footer>
  &copy; <%= year %> MyApp. All rights reserved.
</footer>
```