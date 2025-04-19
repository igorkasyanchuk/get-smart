## 🔄 Validate Redirect URLs

Avoid open redirects by ensuring redirect URLs are within allowed hosts or paths. Use `redirect_back` with fallbacks.

```ruby
# Unsafe:
redirect_to params[:redirect_to]

# Safe:
allowed = URI.parse(params[:redirect_to] || '').host == request.host
redirect_to(allowed ? params[:redirect_to] : root_path)

# Or use:
redirect_back(fallback_location: root_path)
```
