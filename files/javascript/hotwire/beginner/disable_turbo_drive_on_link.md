## 🔧 Disable Turbo Drive on a Specific Link

Turbo Drive intercepts link clicks by default. To opt out for a specific link, add `data-turbo="false"`.

```erb
<%= link_to "Full reload page", some_path, data: { turbo: false } %>
```  
This will perform a full page load instead of a Turbo visit.