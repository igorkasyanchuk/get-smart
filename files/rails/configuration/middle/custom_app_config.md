## 🛠️ Custom `config.x` Settings

Rails provides a convenient `config.x` namespace to store custom configuration in a centralized place. You can define arbitrary settings in `config/application.rb` and override them per environment in `config/environments/*.rb`. This keeps your magic numbers or feature flags organized and accessible throughout the app via `Rails.configuration.x`.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Define default custom settings
    config.x.api_timeout_seconds = 5
    config.x.feature_flags = { new_checkout: false }
  end
end

# config/environments/production.rb
Rails.application.configure do
  # Override in production
  config.x.api_timeout_seconds = 10
  config.x.feature_flags[:new_checkout] = true
end
```

Now you can call `Rails.configuration.x.api_timeout_seconds` anywhere in your code or initializers.