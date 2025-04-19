## 🚀 Passing Locals to Partials

Partials accept local variables to make them reusable and decoupled from controllers. You can pass any Ruby object via the `locals:` hash to the partial, enabling clear data flow and easier testing. Avoid relying on instance variables inside partials to keep them self‐contained and explicit about their dependencies.

```erb
<!-- In your view -->
<%= render partial: 'user_profile', locals: { user: @user, show_email: true } %>

<!-- _user_profile.html.erb -->
<p>Name: <%= user.name %></p>
<% if show_email %>
  <p>Email: <%= user.email %></p>
<% end %>
```