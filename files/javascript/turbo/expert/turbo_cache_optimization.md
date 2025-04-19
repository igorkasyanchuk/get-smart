## ⚡️ Turbo Cache Invalidation and Optimization
Turbo caches frames by default to speed up navigation, but stale content can be an issue. Implement a cache header and metadata-driven invalidation mechanism to selectively expire frames.

```ruby
# app/controllers/application_controller.rb
before_action :set_turbo_cache_headers

def set_turbo_cache_headers
  response.headers["Cache-Control"] = "no-cache, max-age=0, must-revalidate"
end
```

Alternatively, tag your frames with a version token:

```erb
<turbo-frame id="sidebar" data-cache-version="<%= current_user.cache_key %>">
  <!-- content -->
</turbo-frame>
```