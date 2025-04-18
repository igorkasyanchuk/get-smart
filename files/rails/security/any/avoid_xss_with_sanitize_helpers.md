## ⚠️ Prevent XSS by Using Rails Sanitization Helpers
Sanitize user input/output by using Rails built-in helpers like `sanitize` or auto-escaping using `html_escape`.

```ruby
# In views
<%= sanitize(@user.bio) %>

# Auto-escaping by default in ERB
<%= @user.name %>

# Explicit escaping
<%= h @user.name %>
```

This prevents malicious scripts embedded in user inputs from executing.