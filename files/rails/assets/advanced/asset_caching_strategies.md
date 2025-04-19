## ⚡ Advanced Asset Caching with Far Future Expires and ETags
Rails fingerprints assets by default, but you can also set cache headers and leverage ETags for faster repeat visits. Configure middleware in `production.rb`:

```ruby
# config/environments/production.rb
Rails.application.configure do
  # Serve static assets with Far‑Future expires header
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'Expires' => 1.year.from_now.to_formatted_s(:rfc822)
  }

  # Enable Rack::ETag to generate ETags automatically
  config.middleware.insert_after ActionDispatch::Static, Rack::ETag
end
```

Clients will cache fingerprinted files for a year and still validate with the ETag if needed, drastically reducing bandwidth.