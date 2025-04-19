## 🔒 Creating password fields
For sensitive inputs like passwords, use `password_field` to mask the input. It functions similarly to `text_field` but hides characters for security. Combine it with validation in the model to enforce length or complexity.

```ruby
<%= form_with model: @user, local: true do |f| %>
  <%= f.label :password %>
  <%= f.password_field :password %>
<% end %>
```
