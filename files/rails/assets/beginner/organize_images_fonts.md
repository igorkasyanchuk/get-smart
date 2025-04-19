## 🖼 Organize Images and Fonts

Keep your images and custom fonts under `app/assets/images` and `app/assets/fonts` for automatic pipeline processing. Reference them in CSS or views using asset helpers to ensure the correct path is used.

```css
/* app/assets/stylesheets/custom.css */
.logo {
  background: url(asset-path('logo.png')) no-repeat;
}
```

```erb
<%= image_tag 'logo.png', alt: 'Company Logo' %>
```