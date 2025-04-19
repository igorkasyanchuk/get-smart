## 🔄 Chain Multiple Transformations

You can combine multiple image_processing operations in a pipeline to perform complex edits. This example uses the gem directly to resize, crop, rotate, and convert the uploaded file before attaching it:

```ruby
# app/services/image_pipeline.rb
class ImagePipeline
  def self.call(uploaded_io)
    ImageProcessing::MiniMagick
      .source(uploaded_io)
      .resize_to_limit(800, 800)
      .crop("800x800+0+0")
      .rotate("90")
      .convert("png")
      .call
  end
end

# Usage in controller
processed_file = ImagePipeline.call(params[:image].tempfile.path)
@photo.image.attach(
  io: File.open(processed_file.path),
  filename: "processed.png",
  content_type: "image/png"
)
```
