## 🧹 Sanitize HTML Input to Prevent XSS Attacks

When allowing rich text input, sanitize it to remove harmful scripts.

```ruby
# Using Rails sanitizer
sanitized_content = ActionController::Base.helpers.sanitize(params[:content])
```

Or use gems like `sanitize` for more control.