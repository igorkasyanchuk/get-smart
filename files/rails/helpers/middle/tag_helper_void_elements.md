## 🏷️ Generating Void Elements with the `tag` Helper

The `tag` helper simplifies self‑closing tags and lets you pass HTML attributes easily. It's concise for images, inputs, or meta tags.

```erb
<%= tag.img src: asset_path('logo.png'), alt: 'Logo', class: 'logo-img' %>
<%= tag.input type: 'text', name: 'search', placeholder: 'Search...', class: 'search-field' %>
```

You can also nest content for non-void tags:

```erb
<%= tag.div class: 'highlight' do %>
  <p>Highlighted content here</p>
<% end %>
```
