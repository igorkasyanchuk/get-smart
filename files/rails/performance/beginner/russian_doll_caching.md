## 📦 Russian Doll Caching
Nested fragment caches can invalidate only inner fragments when data changes. This strategy makes cache expiration granular and avoids rebuilding large caches unnecessarily.

```erb
<% cache(@post) do %>
  <h2><%= @post.title %></h2>
  <% @post.comments.each do |comment| %>
    <% cache(comment) do %>
      <p><%= comment.body %></p>
    <% end %>
  <% end %>
<% end %>
```