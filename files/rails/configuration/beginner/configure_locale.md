## 🌐 Configure Default Locale

Rails defaults to English (`:en`) but supports many locales. Set your default language so translations load automatically.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # List available locales (you need matching yml files in config/locales)
    config.i18n.available_locales = [:en, :es, :fr]
    # Set default locale to Spanish
    config.i18n.default_locale = :es
  end
end
```

You can then create `config/locales/es.yml` and use `t('hello')` in views to serve text in Spanish.