## 🚀 Fragment Caching in Views
Cache expensive-to-render view fragments to speed up page loads. Use the `cache` helper with a record or custom key to expire cache automatically when data changes.

```erb
<% cache @post do %>
  <h2><%= @post.title %></h2>
  <p><%= @post.content %></p>
<% end %>
```