## 🎨 Custom Watermark Processor

When you need to apply the same watermark across multiple images in a pipeline, build a custom processor class. This gives you a reusable step that can be chained with any other transformations. Below is an example using ImageProcessing with MiniMagick to inject a transparent logo in the bottom‐right corner.

```ruby
# app/lib/image_processors/watermark_processor.rb
class WatermarkProcessor
  def initialize(logo_path:, gravity: 'SouthEast', dissolve: '30%')
    @logo_path = logo_path
    @gravity    = gravity
    @dissolve   = dissolve
  end

  # Called by ImageProcessing::Builder
  def call(image)
    image.composite(@logo_path) do |c|
      c.gravity @gravity
      c.dissolve @dissolve
    end
  end
end

# Usage in your Rails uploader or service
require 'image_processing/mini_magick'

processor = ImageProcessing::MiniMagick
  .source(uploaded_file)
  .resize_to_limit(1200, 1200)
  .custom(WatermarkProcessor.new(
    logo_path: Rails.root.join('app/assets/images/logo.png'),
    gravity: 'SouthEast',
    dissolve: '25%'
  ))

processed = processor.call
# save processed somewhere
```