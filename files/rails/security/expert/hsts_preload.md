## 🔐 HSTS with Preload & Subdomains
HTTP Strict Transport Security (HSTS) ensures browsers only use HTTPS for your domain. For maximum effect, enable `preload` and include subdomains so entry via plain HTTP is impossible anywhere in your app.

```ruby
# config/environments/production.rb
Rails.application.config.ssl_options = {
  hsts: {
    expires: 1.year.to_i,
    subdomains: true,
    preload: true
  }
}
```

After rollout, submit your domain to Google’s HSTS Preload List: https://hstspreload.org/ to protect first-time visits too.
