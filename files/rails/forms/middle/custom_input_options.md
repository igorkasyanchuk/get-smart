## 🎨 Customize input HTML attributes
Rails form helpers accept HTML options to style and add hints to your inputs. Use options like `placeholder`, `class`, or `data` attributes directly in the helper call.

```erb
<%= form_with(model: @user) do |form| %>
  <%= form.email_field :email, placeholder: 'user@example.com', class: 'form-control' %>
  <%= form.password_field :password, data: { toggle: 'password-visibility' } %>
  <%= form.submit 'Register', class: 'btn btn-primary' %>
<% end %>
```
