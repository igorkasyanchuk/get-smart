## 🗂️ Use Fragment Caching
Cache expensive parts of your view to avoid re-rendering on every request. Fragment caching stores rendered HTML for quick reuse, speeding up response times.

```erb
<% cache(@article) do %>
  <h1><%= @article.title %></h1>
  <p><%= @article.body %></p>
<% end %>
```