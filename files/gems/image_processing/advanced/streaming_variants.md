## ⚡ Memory‐Efficient Streaming Variants

For very large images or high‐throughput APIs, avoid loading full images into memory by streaming processing results directly to an IO. This pattern keeps your app’s memory footprint low and integrates smoothly with Rails controllers.

```ruby
# In a controller action
def show
  variant = ImageProcessing::Vips
    .source(user.avatar.download_blob_to_tempfile)
    .resize_to_limit(2000, 2000)
    .convert('webp')

  # Stream result to client without persisting locally
  response.headers['Content-Type'] = 'image/webp'
  response.headers['Cache-Control'] = 'public, max-age=31536000'
  self.response_body = variant.call_stream
end
```