## 🌐 Locale Fallbacks

When a translation is missing for the current locale, you can configure fallbacks to another locale (e.g., English). Enable the `i18n` fallback middleware and specify fallback chains in your application config.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.i18n.default_locale = :fr
    config.i18n.fallbacks = [:en]
  end
end
```

Now `t('hello')` will return the French translation if available, otherwise fallback to English.