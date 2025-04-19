## 🔑 Dynamic Fragment Caching with Versioned Keys

Tailor fragment cache keys to dynamic data (e.g., user locale, theme, or feature flags) by interpolating runtime values. This practice avoids polluting unrelated caches and ensures each variation is invalidated correctly.

```erb
<!-- app/views/shared/_navigation.html.erb -->
<% cache [current_user.id, I18n.locale, feature_enabled?(:beta_ui)] do %>
  <nav>
    <%# build nav links here %>
  </nav>
<% end %>
```

```ruby
# Optionally define a helper to generate a stable cache key
module CacheKeyHelper
  def nav_cache_key(user)
    [user.cache_key_with_version, I18n.locale, feature_enabled?(:beta_ui)]
  end
end
```

Using arrays ensures Rails generates a single string key, and changing any component forces expiration of only that variant.