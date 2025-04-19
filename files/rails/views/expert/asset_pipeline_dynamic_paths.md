## 💡 Extend the Asset Pipeline with Dynamic Paths
Customize Sprockets to serve assets based on tenant or theme by adding dynamic asset paths at runtime.

```ruby
# config/initializers/sprockets.rb
Rails.application.config.assets.paths <<
  Rails.root.join('app', 'assets', current_tenant.theme)
```

Helper for themed assets:

```ruby
def themed_image_tag(name)
  image_tag File.join(current_tenant.theme, name)
end
```