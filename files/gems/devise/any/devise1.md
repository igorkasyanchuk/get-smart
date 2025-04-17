### 🔐 Devise Quick Tip: Easily Check if a User is Signed In

Use Devise's helper method `user_signed_in?` for quick authentication checks.

**Example:**

```erb
<% if user_signed_in? %>
  Welcome back, <%= current_user.email %>!
<% else %>
  Please sign in to continue.
<% end %>
```
