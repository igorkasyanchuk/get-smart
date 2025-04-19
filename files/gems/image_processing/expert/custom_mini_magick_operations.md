## 🛠️ Custom MiniMagick Operations

When you need a bespoke image operation not provided out of the box, you can inject custom MiniMagick commands into your pipeline. This allows you to leverage any ImageMagick feature (like convolution, morphology, or custom color adjustments) while still using the familiar `image_processing` DSL.

```ruby
require "image_processing/mini_magick"

module CustomProcessors
  def self.your_custom_filter(img)
    img.combine_options do |cmd|
      cmd.contrast
      cmd.morphology("Convolve", "Diamond:1")
      cmd.colorspace("Gray")
    end
  end
end

processor = ImageProcessing::MiniMagick
  .source("input.jpg")
  .loader(page: 0)
  .custom { |img| CustomProcessors.your_custom_filter(img) }
  .convert("png")
  .call

puts "Result saved to ", processor.path
```