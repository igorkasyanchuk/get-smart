## 🌐 Utilize Web Console in Error Pages

Web Console injects a live console into Rails error pages in development, letting you inspect the failing request context without leaving the browser. This is especially handy when debugging view or helper errors triggered during a request.

```ruby
# Gemfile (development only)
gem 'web-console', '>= 4.0'

# config/environments/development.rb
config.web_console.whitelisted_ips = '0.0.0.0/0'  # Adjust as needed
```

On a runtime error, scroll down in your browser’s error page and use the embedded console to inspect `params`, view instance variables, or run arbitrary code.