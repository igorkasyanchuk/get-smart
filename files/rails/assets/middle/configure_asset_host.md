## 🌐 Configure a Custom `asset_host` for CDNs
Offload static assets to a CDN by setting `config.action_controller.asset_host` in your environment config. This speeds up asset delivery and leverages edge caching. Ensure you include the proper protocol or use protocol-relative URLs for flexibility.

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.action_controller.asset_host = 'https://cdn.example.com'
  # or protocol-relative
  # config.action_controller.asset_host = '//cdn.example.com'
end
```
