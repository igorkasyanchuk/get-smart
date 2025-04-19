## 📁 Adding file upload fields
Use `file_field` to let users upload files. Ensure your form has `multipart: true` to handle binary data. In the controller, permit the file parameter and store it with Active Storage or another library.

```ruby
<%= form_with model: @avatar, local: true, multipart: true do |f| %>
  <%= f.label :image, "Upload Avatar" %>
  <%= f.file_field :image %>
  <%= f.submit "Upload" %>
<% end %>
```
