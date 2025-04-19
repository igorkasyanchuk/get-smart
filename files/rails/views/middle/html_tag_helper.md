## 🏷️ Dynamic Tags with the tag Helper
Use Rails’ `tag` helper to generate HTML elements without escaping, especially handy for dynamic attribute sets. It keeps logic out of your templates and ensures proper escaping.

```erb
<%= tag.div class: "alert #{alert_type}" do %>
  <%= message %>
<% end %>
```