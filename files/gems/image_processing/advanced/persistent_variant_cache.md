## 💾 Persistent Variant Cache

Recomputing the same variant on each request wastes CPU. Use a deterministic cache directory keyed by processing parameters so you only touch disk when parameters change. This pattern works outside ActiveStorage or to complement its built‐in caching.

```ruby
require 'digest'

def cached_variant(source_path, width:, height:, format: 'jpg')
  key = Digest::SHA1.hexdigest([source_path, width, height, format].join(':'))
  cache_dir = Rails.root.join('tmp', 'image_processing_cache')
  FileUtils.mkdir_p(cache_dir)
  cached_path = cache_dir.join("#{key}.#{format}")

  return cached_path if File.exist?(cached_path)

  ImageProcessing::MiniMagick
    .source(source_path)
    .resize_to_limit(width, height)
    .convert(format)
    .call(destination: cached_path.to_s)

  cached_path
end

# Usage
variant_path = cached_variant(
  user.avatar.path,
  width: 800,
  height: 600,
  format: 'png'
)
send_file variant_path, type: 'image/png', disposition: 'inline'
```