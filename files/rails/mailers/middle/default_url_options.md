## 🔗 Configure default_url_options in Environments

Links in mailers need full URLs (host, protocol). Set `default_url_options` in your environment configs to avoid missing host errors.

```ruby
# config/environments/development.rb
Rails.application.routes.default_url_options = { host: 'localhost', port: 3000 }
# config/environments/production.rb
Rails.application.routes.default_url_options = { host: 'example.com', protocol: 'https' }
```

Now helpers like `edit_user_url(@user)` in your mailer views generate absolute URLs automatically.