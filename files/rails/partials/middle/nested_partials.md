## 🏗️ Structuring Views with Nested Partials

Nested partials help organize complex views into smaller, maintainable pieces. You can combine partials to build components like cards or layouts, passing data down multiple levels. This modular approach improves readability and encourages reuse across your application.

```erb
<!-- posts/index.html.erb -->
<%= render partial: 'posts/post_card', collection: @posts, as: :post %>

<!-- _posts/post_card.html.erb -->
<div class="card">
  <h2><%= post.title %></h2>
  <p><%= truncate(post.body, length: 100) %></p>
  <%= render 'posts/post_actions', post: post %>
</div>

<!-- _posts/post_actions.html.erb -->
<div class="actions">
  <%= link_to 'Edit', edit_post_path(post) %> |
  <%= link_to 'Delete', post, method: :delete, data: { confirm: 'Are you sure?' } %>
</div>
```