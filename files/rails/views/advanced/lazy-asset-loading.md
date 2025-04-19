## ⚡ Tip: Lazy-Load Images and Scripts via `loading` Attribute
Improve initial render by deferring off-screen media. Use the `loading="lazy"` attribute in your ERB templates and conditional `javascript_include_tag`.

Example:

```erb
<%= image_tag @product.image_url, loading: 'lazy', alt: @product.name %>

<% if controller_name == 'products' %>
  <%= javascript_include_tag 'products', defer: true %>
<% end %>
```