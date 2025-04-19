## 🛠️ Use Webpacker `asset_pack_tag` for Modern JavaScript
When working with Rails 6+ and Webpacker, prefer `asset_pack_tag` instead of `javascript_include_tag` to load your compiled JS packs. This ensures you get the correct fingerprinted asset path and leverages code splitting. You can also pass `defer: true` or other HTML options directly.

```erb
<%= asset_pack_tag 'application', defer: true, 'data-turbolinks-track': 'reload' %>
```

You can similarly load CSS packs:

```erb
<%= stylesheet_pack_tag 'application', media: 'all' %>
```
