## 🔒 Securing & Optimizing URLs with CloudFront Signed URLs

Replace default S3 presigned URLs with CloudFront signed URLs for low‑latency delivery and add custom headers for HSTS, caching or token validation.

1. Create a custom service inheriting from S3:

```ruby
# lib/active_storage/service/cloudfront_service.rb
require 'aws-sdk-cloudfront'

class ActiveStorage::Service::CloudFrontService < ActiveStorage::Service::S3Service
  def url(key, **options)
    signer = Aws::CloudFront::UrlSigner.new(
      key_pair_id: ENV['CF_KEYPAIR_ID'],
      private_key: ENV['CF_PRIVATE_KEY_PATH']
    )
    url = "https://#{ENV['CF_DOMAIN']}/#{key}"
    signer.signed_url(url, expires: options[:expires_in] || 300)
  end
end
```

2. Register in `config/storage.yml`:

```yaml
cloudfront:
  service: CloudFrontService
  access_key_id: <%= ENV['S3_KEY'] %>
  secret_access_key: <%= ENV['S3_SECRET'] %>
  region: <%= ENV['AWS_REGION'] %>
  bucket: <%= ENV['S3_BUCKET'] %>
```

3. Use the new service and set security headers in your CDN or Rails middleware:

```ruby
# config/environments/production.rb
config.active_storage.service = :cloudfront
Rails.application.config.middleware.insert_before 0, Rack::ContentSecurityPolicy do |policy|
  policy.default_src :self, :https
  policy.img_src     :self, :https, ENV['CF_DOMAIN']
end
```