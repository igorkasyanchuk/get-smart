## 🚀 Enable Direct Uploads in Forms
Leverage direct uploads to S3 (or configured service) for faster user experience by bypassing your server. Just enable the `direct_upload: true` option on your form helper and include the JavaScript package.

```erb
<%= form_with(model: @document, local: true) do |form| %>
  <%= form.file_field :file, direct_upload: true %>
  <%= form.submit %>
<% end %>
```

```javascript
// app/javascript/packs/application.js
import "@rails/activestorage"
Rails.start()
ActiveStorage.start()
```

When a user selects a file, the browser uploads it directly to the storage service and assigns a signed blob ID to your form. This reduces load on your Rails server and provides upload progress events you can hook into.