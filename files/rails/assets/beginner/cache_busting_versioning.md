## 🔄 Cache Busting with Asset Versioning

To force browsers to load new versions of assets after you deploy, bump the asset version. Rails will append this version to asset URLs, ensuring clients fetch the latest files.

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.version = '1.1'
```

```erb
<%= stylesheet_link_tag 'application', 'data-turbolinks-track': 'reload' %>
```