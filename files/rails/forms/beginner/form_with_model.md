## 📝 Using `form_with` with a model
`form_with` is the recommended way to build forms backed by models in Rails 5.1+. It automatically sets the correct URL and HTTP method based on whether the record is new or existing. Use the `local: true` option to disable AJAX and keep it simple.

```ruby
<%= form_with model: @user, local: true do |form| %>
  <%= form.label :name %>
  <%= form.text_field :name %>
  <%= form.submit "Save" %>
<% end %>
```
