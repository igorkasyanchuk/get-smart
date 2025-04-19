## 🔍 Conditional Resizing to Prevent Upscaling

Maintain image quality by only shrinking larger images and leaving smaller ones intact. The `>` geometry flag tells ImageMagick to apply resizing only when the source exceeds the specified dimensions.

```ruby
image = MiniMagick::Image.open("photo.jpg")
# Resize only if width or height is greater than 1000px
image.resize "1000x1000>"

image.write("photo_thumbnail.jpg")
```