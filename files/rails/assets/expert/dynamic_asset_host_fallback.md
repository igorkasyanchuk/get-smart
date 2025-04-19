## 🚀 Dynamic Asset Host with CDN Failover

Configure `ActionController.asset_host` as a `Proc` to distribute assets across multiple CDNs with optional health checks. This setup enhances resilience and balances load by hashing the asset path.

```ruby
# config/environments/production.rb
config.action_controller.asset_host = Proc.new do |source, request|
  cdns = ['https://cdn1.example.com', 'https://cdn2.example.com']
  # Select host based on source hash
  cdns[Zlib.crc32(source) % cdns.size]
end
```