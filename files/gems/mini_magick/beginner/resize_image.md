## 🔄 Simple Image Resizing

Resizing images is one of the most common tasks. Use MiniMagick to open an image and resize it while preserving the aspect ratio.

```ruby
require 'mini_magick'

image = MiniMagick::Image.open('input.jpg')
image.resize '800x600'
image.write 'output_resized.jpg'
```

This will scale your image to fit within 800×600 pixels, keeping proportions intact.