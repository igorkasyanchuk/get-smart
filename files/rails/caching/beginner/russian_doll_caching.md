## 🎁 Russian Doll Caching

Russian doll caching composes nested fragments so that parent fragments don’t need to be expired when a child changes. You simply wrap each nested element in its own `cache` call, and Rails merges the keys automatically.

```erb
<%# app/views/posts/_post.html.erb %>
<% cache(post) do %>
  <div class="post">
    <h2><%= post.title %></h2>
    <div class="comments">
      <% post.comments.each do |comment| %>
        <% cache(comment) do %>
          <p><strong><%= comment.user %>:</strong> <%= comment.body %></p>
        <% end %>
      <% end %>
    </div>
  </div>
<% end %>
```