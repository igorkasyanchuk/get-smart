## 🕒 Configure Application Time Zone

By default, Rails uses UTC as the application time zone. You can change it in `config/application.rb` so timestamps and ActiveRecord fields use your local zone consistently.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Set your preferred time zone
    config.time_zone = 'Eastern Time (US & Canada)'
    # Ensure ActiveRecord stores times in local zone
    config.active_record.default_timezone = :local
  end
end
```

This ensures ActiveRecord models and view helpers like `Time.current` respect your configured zone.