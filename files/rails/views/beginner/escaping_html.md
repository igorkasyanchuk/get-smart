## 🛡️ Escape HTML Safely with `sanitize`

Rails escapes strings by default to prevent XSS. If you need to allow safe HTML tags, use `sanitize` to whitelist them, or call `html_safe` on trusted content.

```erb
<%# Automatic escaping %>
<p><%= @comment.body %></p>

<%# Allow limited tags: %>
<p><%= sanitize(@comment.body, tags: %w(strong em a), attributes: %w(href)) %></p>
```