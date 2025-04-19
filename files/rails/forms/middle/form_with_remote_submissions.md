## 🚀 Prefer `form_with` for remote submissions
form_with is the unified helper for creating forms in Rails 5 and above. To enable AJAX submissions, set `local: false`, which will automatically use `remote: true` under the hood and handle CSRF tokens and method spoofing for you.

```erb
<%= form_with(model: @article, local: false) do |form| %>
  <%= form.text_field :title %>
  <%= form.submit "Save" %>
<% end %>
```
