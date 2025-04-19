## ❓ Add Conditional Logic in Views

ERB supports Ruby conditionals, letting you render different content based on state. Use `if`, `elsif`, `else`, and `unless` for branching.

```erb
<% if @user.admin? %>
  <p>Welcome, Admin!</p>
<% elsif @user.moderator? %>
  <p>Welcome, Moderator!</p>
<% else %>
  <p>Welcome, Guest!</p>
<% end %>
```