## 📄 Tip: Preserve line breaks with `simple_format`
The `simple_format` helper wraps plain text in paragraph tags and converts line breaks to `<br>` tags. It’s great for rendering user-submitted text safely.

```erb
<%= simple_format @comment.body %>
```

This outputs paragraphs and line breaks automatically, ensuring readable text formatting.