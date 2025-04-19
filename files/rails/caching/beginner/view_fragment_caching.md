## 🗂️ View Fragment Caching

Fragment caching lets you cache pieces of your view that are expensive to render. Wrap the block you want to cache with the `cache` helper, providing a unique key. Rails will store the rendered output and reuse it until the cache expires or is cleared.

```erb
<%# app/views/posts/index.html.erb %>
<% @posts.each do |post| %>
  <% cache(post) do %>
    <div class="post">
      <h2><%= post.title %></h2>
      <p><%= post.body.truncate(100) %></p>
    </div>
  <% end %>
<% end %>
```