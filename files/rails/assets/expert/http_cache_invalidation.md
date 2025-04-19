## 🔄 Fine-Grained HTTP Cache Invalidation with Middleware

Combine fingerprinted assets with a custom Rack middleware to purge stale entries and set immutable cache headers. This guarantees clients always fetch updated assets while leveraging aggressive caching.

```ruby
# lib/middleware/asset_cache_invalidator.rb
class AssetCacheInvalidator
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    if env['PATH_INFO'].start_with?('/assets/')
      headers['Cache-Control'] = 'public, max-age=31536000, immutable'
      manifest = Rails.application.assets_manifest
      asset = env['PATH_INFO'].sub('/assets/', '')
      # Return 404 for missing or stale assets
      unless manifest.assets.key?(asset)
        status = 404
      end
    end
    [status, headers, body]
  end
end

# config/application.rb
config.middleware.insert_before Rack::Sendfile, AssetCacheInvalidator
```