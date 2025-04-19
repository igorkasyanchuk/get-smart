## 📤 Direct S3 Uploads with Active Storage

Leverage Active Storage’s built-in direct upload feature for large file handling. Configure your bucket, enable direct uploads in JavaScript, and add hidden fields for the blob signed ID.

```js
// app/javascript/packs/application.js
import "@rails/activestorage"
Rails.start()
ActiveStorage.start()
```

```erb
<!-- app/views/articles/_form.html.erb -->
<%= form_with(model: @article) do |f| %>
  <%= f.file_field :image, direct_upload: true %>
  <%= f.submit %>
<% end %>
```