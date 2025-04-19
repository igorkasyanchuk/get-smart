## 🔒 Advanced Caching Strategies with ActiveStorage

To avoid reprocessing unchanged variants, integrate a custom cache key that reflects processing parameters and source metadata. This technique leverages Rails.cache or your CDN cache to instantly serve existing variants, reducing CPU cycles and I/O.

```ruby
class VariantCacheKey
  def self.generate(io:, transformations:)
    metadata = io.is_a?(String) ? File.mtime(io).to_i : io.metadata[:sha256]
    params_digest = Digest::SHA256.hexdigest(transformations.sort.to_h.to_s)
    "variant/#{metadata}/#{params_digest}"
  end
end

# In your controller or ActiveJob
transformations = { resize: [800, 600], format: "webp", quality: 80 }
cache_key = VariantCacheKey.generate(io: blob.download, transformations: transformations)

variant_url = Rails.cache.fetch(cache_key, expires_in: 1.week) do
  blob.variant(**transformations).processed.service_url
end

render json: { url: variant_url }
```