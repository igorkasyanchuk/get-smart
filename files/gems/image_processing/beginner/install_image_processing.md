## 📦 Install and configure the ImageProcessing gem

Add the gem to your Gemfile to start processing images with MiniMagick and Active Storage. Then configure the variant processor in an initializer to ensure Rails uses ImageProcessing for variants.

```ruby
# Gemfile
gem 'image_processing', '~> 1.12'

# config/initializers/image_processing.rb
Rails.application.config.active_storage.variant_processor = :mini_magick
```

This setup enables you to generate and cache image variants seamlessly.