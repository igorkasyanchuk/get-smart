## 🛠 Custom Variant Processor

You can extend Active Storage’s variant processing by registering custom processors. This is useful for adding watermarks, overlays, or other bespoke image transformations. Create a new processor class and register it in `config/initializers/active_storage.rb`.

```ruby
# app/lib/active_storage/processor/watermark_processor.rb
module ActiveStorage
  class Processor::WatermarkProcessor
    def initialize(file, options = {})
      @file = file
      @watermark = options.fetch(:watermark_path)
    end

    def call
      image = MiniMagick::Image.read(@file)
      watermark = MiniMagick::Image.open(@watermark)
      image = image.composite(watermark) do |c|
        c.gravity "SouthEast"
      end
      image.to_blob
    end
  end
end

# config/initializers/active_storage.rb
Rails.application.config.active_storage.variant_processor = :mini_magick
ActiveStorage::Variant.module_eval do
  register_processor :watermark, ActiveStorage::Processor::WatermarkProcessor
end

# Usage in a view:
<%= image_tag user.avatar.variant(watermark: { watermark_path: Rails.root.join("app/assets/images/logo.png") }) %>
```