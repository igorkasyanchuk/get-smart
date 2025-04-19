## 📂 Upload files with Active Storage
Integrate file uploads seamlessly by using `form.file_field` with Rails Active Storage. Ensure your model has `has_one_attached` or `has_many_attached` for attachments.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_one_attached :avatar
end
```

```erb
<%= form_with(model: @user) do |form| %>
  <%= form.file_field :avatar %>
  <%= form.submit 'Upload Avatar' %>
<% end %>
```
