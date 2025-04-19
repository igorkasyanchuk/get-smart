## 🖼️ Use `image_tag` for Asset Pipeline

`image_tag` helps you include images managed by the asset pipeline. It adds timestamp-based cache busting and optional HTML attributes.

```erb
<%= image_tag 'logo.png', alt: 'MyApp Logo', class: 'logo' %>
<%= image_tag asset_path('avatars/user.png'), size: '50x50' %>
```