## 🔧 Configure Cache Store

Before using caching in Rails, you need to choose and configure a cache store. In `config/environments/development.rb` or `production.rb`, set the `cache_store` option to something like `:memory_store`, `:file_store`, or `:mem_cache_store`. This determines where Rails will keep your cached data and how long it lasts.

```ruby
# config/environments/production.rb
Rails.application.configure do
  # Use memory store for small apps or file store for simple setups
  config.cache_store = :memory_store, { size: 64.megabytes }

  # Enable controller caching
  config.action_controller.perform_caching = true
end
```