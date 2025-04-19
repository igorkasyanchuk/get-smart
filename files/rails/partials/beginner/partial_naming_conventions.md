## ⚙️ Partial Naming Conventions
Rails partial filenames must start with an underscore and live in the corresponding view folder. This ensures `render` locates them correctly.

```text
app/views/users/_profile.html.erb
app/views/shared/_navigation.html.erb
```

You can render them with:

```erb
<%= render "users/profile", user: @user %>
<%= render "shared/navigation" %>
```

Following this convention keeps your view structure organized and predictable.