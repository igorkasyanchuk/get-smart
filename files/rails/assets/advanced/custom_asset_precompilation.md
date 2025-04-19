## 🚀 Efficient Custom Asset Precompilation
By default Rails precompiles `application.js` and `application.css`, but you can target additional files or patterns to speed up your build and avoid bloated manifests. Add glob patterns or specific filenames to `config.assets.precompile` in an initializer.

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.version = '1.0'
# Precompile all JS/CSS in vendor folder and .svg icons
Rails.application.config.assets.precompile += %w(
  admin.js
  admin.css
)
Rails.application.config.assets.precompile += Dir.glob(
  Rails.root.join('app', 'assets', 'images', 'icons', '*.svg')
).map { |path| "icons/" + File.basename(path) }
```

This ensures only the files you actually use are fingerprinted, reducing compile time and manifest size.