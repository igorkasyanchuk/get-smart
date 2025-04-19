## 📦 Leveraging Asset Helpers in Layouts

Use Rails asset helpers in your layouts to include stylesheets and scripts with fingerprinting. Switch between Sprockets and Webpacker helpers depending on your setup.

```erb
<!-- Sprockets example in app/views/layouts/application.html.erb -->
<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
```

```erb
<!-- Webpacker example -->
<%= stylesheet_pack_tag 'application', media: 'all' %>
<%= javascript_pack_tag 'application' %>
```