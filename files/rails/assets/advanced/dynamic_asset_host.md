## 🌐 Dynamic Asset Hosts and CDN Integration
For global apps, assign different asset hosts per request or region. You can use a lambda for `asset_host`: 

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.action_controller.asset_host = ->(source, request) do
    region = request&.host&.split('.')&.last || 'us'
    "https://cdn-#{region}.example.com"
  end
end
```

This logic picks a CDN subdomain based on the request’s host. Assets like images, JS, and CSS will be served from the optimal location automatically.