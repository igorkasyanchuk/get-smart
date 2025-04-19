## 🏷️ Generate Custom Tags with `content_tag`

`content_tag` builds HTML elements programmatically, which is useful inside helpers or when conditions determine tag names/attributes.

```erb
<%= content_tag :div, class: 'alert alert-danger' do %>
  <strong>Error:</strong> <%= @error_message %>
<% end %>
```