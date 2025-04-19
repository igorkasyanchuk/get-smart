## 💾 Caching Translations with MemCacheStore and Digest Keys
Under heavy load, caching each translation lookup can shave milliseconds off every `t` call. Configure Rails to use your cache store and namespace keys by the YAML digest for automatic invalidation on file changes.

```ruby
# config/initializers/i18n_cache.rb
require 'digest'

yaml_digest = Digest::MD5.hexdigest(
  Dir[ Rails.root.join('config','locales','**','*.yml') ].sort.map { |f| File.read(f) }.join
)

Rails.application.config.i18n.tap do |config|
  config.cache_store = :mem_cache_store, { namespace: "i18n:#{yaml_digest}" }
  config.backend = I18n::Backend::Cache.new(I18n.backend, ActiveSupport::Cache.lookup_store(config.cache_store))
end
```

Whenever locale files change, the digest changes, automatically expiring old cache entries. This ensures your translations stay fresh in production.