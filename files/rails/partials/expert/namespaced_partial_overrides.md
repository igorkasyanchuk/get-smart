## 🎨 Namespaced Partial Overrides for Theming

Enable app-specific or engine-level overrides by prepending view paths at runtime. This allows you to ship default partials in gems or engines and let applications override them without touching your codebase.

```ruby
# config/initializers/view_paths.rb
Rails.application.config.to_prepare do
  ApplicationController.prepend_view_path(Rails.root.join('app','views','overrides'))
end
```

```erb
# app/views/overrides/products/_product.html.erb
<div class="themed-product">
  <!-- override default product partial here -->
</div>
```