## 🔀 Dynamically Mount Engines at Runtime

You can load and mount Rails engines based on database entries or environment flags to create a plugin-based architecture. This approach helps you enable or disable features without changing code, ideal for multi-tenant or modular apps.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  FeatureToggle.enabled_engines.each do |engine_name|
    engine_class = "#{engine_name}::Engine".constantize
    mount engine_class => "/#{engine_name.underscore}"
  end
end
```

Here, `FeatureToggle.enabled_engines` returns an array of engine module names. Rails will mount only the specified engines, keeping your routes file clean and dynamic.