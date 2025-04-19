## 🚨 Integrate Exception Notifications

Automatically alert on critical exceptions in web requests or background jobs by integrating exception_notification. This ensures your team is notified via email, Slack, or other channels whenever a failure occurs. Configure notifier middleware and customize filters to avoid noise.

```ruby
# Gemfile
gem 'exception_notification'

# config/initializers/exception_notification.rb
Rails.application.config.middleware.use ExceptionNotification::Rack,
  email: {
    email_prefix: "[Error] ",
    sender_address: %{"Notifier" <notifier@example.com>},
    exception_recipients: %w{devs@example.com}
  },
  ignore_exceptions: ExceptionNotifier.ignored_exceptions + ['Payments::CurrencyMismatch']
```

Now any unhandled exceptions will trigger an email notification, filtered by your ignore list.