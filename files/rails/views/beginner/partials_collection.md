## 🔄 Render Collections Efficiently

Rails can render a collection of similar objects in one call. It automatically iterates and sets a local named after the partial.

```erb
<!-- app/views/comments/_comment.html.erb -->
<p><strong><%= comment.author %>:</strong> <%= comment.body %></p>

<!-- app/views/comments/index.html.erb -->
<%= render partial: 'comment', collection: @comments %>
```