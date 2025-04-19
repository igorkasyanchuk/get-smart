## 🛠 Custom Sprockets Processor for Asset Optimization

By registering a custom Sprockets processor, you can optimize assets (e.g., SVG minification or image compression) as part of the pipeline. This hook runs during precompilation and ensures all assets meet your optimization criteria.

```ruby
# config/initializers/sprockets_optimize.rb
Rails.application.config.assets.configure do |env|
  env.register_preprocessor 'image/svg+xml', :optimize_svg do |context, data|
    # Use svgo via CLI or ruby gem
    optimized = `svgo --input "#{context.filename}" --output -`
    optimized.presence || data
  end
end
```