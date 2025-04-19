## 🚨 Displaying error messages
To show validation errors next to form fields, wrap checks for `object.errors` in your form view. Displaying errors improves UX by providing immediate feedback. Iterate over `@model.errors.full_messages` to list all messages.

```erb
<%= form_with model: @user, local: true do |f| %>
  <% if @user.errors.any? %>
    <div class="errors">
      <h2><%= pluralize(@user.errors.count, "error") %> prohibited this user from saving:</h2>
      <ul>
        <% @user.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <%= f.label :email %>
  <%= f.email_field :email %>
  <%= f.submit %>
<% end %>
```
