## 📝 Organized Layouts with content_for
Use `content_for` to inject custom content into your application layout from individual views. This is handy for per-page scripts, styles, or meta tags without cluttering your layout file.

```erb
<% content_for :head do %>
  <%= stylesheet_link_tag "posts_custom" %>
<% end %>
```

In `application.html.erb`:

```erb
<head>
  <%= yield :head %>
</head>
```