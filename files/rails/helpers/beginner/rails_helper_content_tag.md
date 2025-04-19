## 🏷️ Tip: Create HTML tags with `content_tag`
The `content_tag` helper lets you generate arbitrary HTML tags with content and attributes, useful for custom wrappers or tags not covered by built-ins.

```erb
<%= content_tag :div, class: 'alert alert-info' do %>
  <strong>Notice:</strong> Your changes were saved.
<% end %>
```

Use blocks to nest content and pass options for HTML attributes.