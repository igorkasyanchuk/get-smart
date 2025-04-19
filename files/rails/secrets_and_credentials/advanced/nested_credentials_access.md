## 🧩 Organize and Access Nested Credentials

For complex apps, store structured secrets using nested YAML in your credentials file. This keeps related values together and improves readability. You can then use `dig` or symbol keys to retrieve deeply nested data without polluting your environment variables.

```yaml
# config/credentials/production.yml.enc
mailer:
  smtp:
    address: smtp.example.com
    port: 587
    user_name: user@example.com
    password: SUPER_SECRET
``` 

```ruby
# config/initializers/smtp.rb
smtp_cfg = Rails.application.credentials.dig(:mailer, :smtp)
ActionMailer::Base.smtp_settings = {
  address: smtp_cfg[:address],
  port: smtp_cfg[:port],
  user_name: smtp_cfg[:user_name],
  password: smtp_cfg[:password],
  authentication: :login
}
```