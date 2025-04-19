## 🛠️ Set Up Your Default Locale

To begin using I18n in Rails, set the default locale and load paths in `config/application.rb`. This tells Rails which language file to use when rendering views and where to find translation files.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Set default locale to Spanish
    config.i18n.default_locale = :es

    # Auto-load all .yml files under config/locales
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
  end
end
```