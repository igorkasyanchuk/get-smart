## ⚙️ Configuring SMTP Settings

Set up your SMTP provider in environment config files so ActionMailer knows how to connect and send emails. Here's an example for Gmail in development:

```ruby
# config/environments/development.rb
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'example.com',
    user_name:            ENV['GMAIL_USERNAME'],
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
```

Ensure environment variables are set and restart your server to apply changes.