## 🚀 Custom ActiveRecord I18n Backend
You can persist translations in the database to allow runtime updates and CMS‑style editing without redeploys. By extending `I18n::Backend::Simple` with `I18n::Backend::KeyValue` or using the `i18n-active_record` gem, you gain CRUD over your locales and can override YAML files at boot time.

```ruby
# config/initializers/i18n_backend.rb
require 'i18n/backend/active_record'
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
I18n::Backend::Chain.new(
  I18n::Backend::ActiveRecord.new,
  I18n::Backend::Simple.new
).tap { |backend| I18n.backend = backend }

# create table via rails g migration CreateTranslations
# fields: locale, key, value, interpolations, is_proc
```

Once set up, you can use `Translation.create(locale: 'fr', key: 'greeting.hello', value: 'Bonjour')` to override or add new entries on the fly.