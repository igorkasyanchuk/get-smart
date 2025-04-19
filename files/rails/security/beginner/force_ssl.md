## ⚠️ Enforce SSL in Production
Redirect all HTTP traffic to HTTPS to protect data in transit. Enable `force_ssl` in your production environment configuration.

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.force_ssl = true
end
```
