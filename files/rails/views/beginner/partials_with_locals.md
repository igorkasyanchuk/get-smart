## 🛠️ Pass Locals to Partials

You can pass custom locals to partials for context-specific data. Use the `locals:` option to define any variable accessible inside your partial.

```erb
<!-- app/views/users/_profile.html.erb -->
<div class="profile">
  <h3><%= user.name %></h3>
  <p>Status: <%= status %></p>
</div>

<!-- app/views/users/show.html.erb -->
<%= render 'profile', locals: { user: @user, status: 'Active' } %>
```