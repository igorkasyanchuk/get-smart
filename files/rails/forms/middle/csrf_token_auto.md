## 🔒 Ensure CSRF protection in forms
Rails automatically includes a hidden `authenticity_token` in every form helper. You can disable it with `authenticity_token: false`, but only if you have another CSRF mitigation strategy in place.

```erb
<%= form_with(model: @comment, authenticity_token: false) do |form| %>
  <%= form.text_area :body %>
  <%= form.submit %>
<% end %>
```
