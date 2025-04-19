## 🌐 Advanced Host Authorization

Prevent host header attacks by whitelisting valid hosts. You can allow subdomains dynamically based on configuration.

```ruby
# config/environments/production.rb
config.hosts = /^(.+.)?yourdomain.com$/  # allow any subdomain
```