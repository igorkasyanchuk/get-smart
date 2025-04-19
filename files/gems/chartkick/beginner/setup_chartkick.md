## 📦 Install and Setup Chartkick

Chartkick makes it super easy to add charts to your Rails app by leveraging popular JavaScript libraries under the hood. First, add the gem and the JS library, then ensure you include the pack in your layout so your charts render correctly.

```ruby
# Gemfile
gem "chartkick"
# and choose a JS charting library (e.g., Chart.js)
gem "chart-js-rails"
```

```bash
# If you're using Webpacker (Rails 6+)
yarn add chartkick chart.js
```

```erb
<!-- app/views/layouts/application.html.erb -->
<%= javascript_pack_tag "application", "data-turbolinks-track": "reload" %>
<%= stylesheet_pack_tag "application", "data-turbolinks-track": "reload" %>
```