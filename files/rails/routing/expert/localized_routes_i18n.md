## 🌐 Localized Routes with I18n and Dynamic Segments

To serve localized URLs (e.g., `/en/about` vs `/fr/a-propos`), leverage I18n translations and define your routes dynamically in `routes.rb`. Use `ActionSupport::Reloader.to_prepare` to reload when translations change in development.

```ruby
# config/locales/routes.en.yml
en:
  routes:
    about: 'about'

# config/locales/routes.fr.yml
fr:
  routes:
    about: 'a-propos'

# config/routes.rb
Rails.application.routes.draw do
  I18n.available_locales.each do |locale|
    scope "/#{locale}", locale: locale do
      get I18n.t('routes.about', locale: locale), to: 'pages#about', as: "about_#{locale}"
    end
  end
end

# config/initializers/locale_routes_reload.rb
Rails.application.reloader.to_prepare do
  Rails.application.routes_reloader.reload!
end
```