## 🔒 Escape HTML Output
Always escape user-generated content to prevent Cross-Site Scripting (XSS). In ERB views, use the `h` helper or `sanitize` to ensure HTML tags are escaped or only allowed tags remain.

```erb
<%= h @user.name %>          # Escapes all HTML
<%= sanitize @post.content, tags: ['strong', 'em'] %>  # Allows only <strong> and <em>
```
