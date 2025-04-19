## ✍️ Creating a Basic Form with simple_form_for

Use `simple_form_for` in your view to build forms quickly. It automatically adds labels, inputs, and error messages based on your model attributes.

```erb
<%= simple_form_for(@user) do |f| %>
  <%= f.input :email %>
  <%= f.input :password, as: :password %>
  <%= f.button :submit, 'Sign Up' %>
<% end %>
```
