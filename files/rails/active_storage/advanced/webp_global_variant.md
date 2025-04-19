## 🎨 Global WebP Variant Conversion

Force all JPEG/PNG variants to be converted to WebP by default to save bandwidth. Monkey-patch the variant show endpoint to set default format, and configure your image processors accordingly.

```ruby
# config/initializers/active_storage.rb
Rails.application.config.to_prepare do
  ActiveStorage::Variation.wrap_processor(:mini_magick) do |processor_class|
    Class.new(processor_class) do
      def process
        super.tap do |v|
          v.processor = :mini_magick
          v.processor_options[:format] ||= 'webp'
        end
      end
    end
  end
end

# Now any call without explicit format uses WebP:
image_tag user.avatar.variant(resize_to_limit: [800, 800])
```