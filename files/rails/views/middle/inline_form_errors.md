## 🏗️ Inline Form Errors with form_with
Show validation errors next to form fields to improve UX. Use `form_with` and inspect `object.errors` inside the form builder block.

```erb
<%= form_with model: @user do |f| %>
  <div>
    <%= f.label :email %>
    <%= f.email_field :email %>
    <span class="error"><%= @user.errors.full_messages_for(:email).first %></span>
  </div>
  <%= f.submit "Sign Up" %>
<% end %>
```