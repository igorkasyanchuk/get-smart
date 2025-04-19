## 🛠️ Custom Console Helpers
You can tailor your Rails console experience by defining helper methods and aliases in your `.pryrc` or `.irbrc`. This allows you to speed up repetitive tasks like reloading seed data, clearing cache, or switching contexts without leaving the console. Simply load your Rails environment and define methods at startup.

```ruby
# ~/.pryrc or ~/.irbrc
if defined?(Rails)
  # Reloads application code and seed data
  def reload_seeds
    Rails.application.reload_routes!
    load Rails.root.join('db', 'seeds.rb')
    puts '✅ Seeds reloaded'
  end

  # Clear Rails cache
  def clear_cache
    Rails.cache.clear
    puts '🗑️  Cache cleared'
  end
end
```

After restarting the console (`rails c`), you can simply call `reload_seeds` or `clear_cache` to invoke your custom logic.