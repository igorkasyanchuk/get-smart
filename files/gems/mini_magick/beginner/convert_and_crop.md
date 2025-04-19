## ✂️ Converting and Cropping Images

You can convert formats and crop photos in one chain to optimize your workflow. The example below converts a PNG to JPEG and crops a 200×200 square from the center.

```ruby
require 'mini_magick'

image = MiniMagick::Image.open('input.png')
image.format 'jpg'
image.combine_options do |c|
  c.gravity 'Center'
  c.crop '200x200+0+0'
end
image.write 'output_cropped.jpg'
```

This code sets the gravity to center, crops the specified area, and writes out a new JPEG file.