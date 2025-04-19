## 🗂️ Rendering Collections Efficiently

Rails can render a collection of objects with a single call to `render`, reducing boilerplate and improving performance. Each element is passed to the partial as a local with an automatically inferred name (singular form of the collection). You can also customize the local name using the `as:` option if your variable naming differs.

```erb
<!-- Automatic local name based on collection -->
<%= render @comments %>

<!-- Explicit partial and local name -->
<%= render partial: 'comment', collection: @comments, as: :comment_item %>

<!-- _comment.html.erb or _comment_item.html.erb -->
<p><strong><%= comment_item.author %>:</strong> <%= comment_item.body %></p>
```