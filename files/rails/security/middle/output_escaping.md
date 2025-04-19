## 🛡️ Escape Output in Views

Ensure all user-provided data is properly escaped in views to prevent XSS attacks. Use Rails helpers like `h`, or use `<%= %>` which auto-escapes, avoiding `raw` unless necessary.

```erb
<!-- app/views/posts/show.html.erb -->
<p><%= @post.title %></p>
<p><%= @post.body %></p>

<!-- Unsafe: -->
<%= raw @post.body %>
```
