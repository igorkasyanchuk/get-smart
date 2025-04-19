## 📄 Basic Partial Rendering
Using partials helps you DRY up your views by extracting reusable markup. You can render a partial with the `render` helper and omit the `partial:` key when using the shorthand.

```erb
<!-- app/views/posts/show.html.erb -->
<%= render "comments/comment" %>
```

This will look for `app/views/comments/_comment.html.erb` and insert its contents here. No need to prefix the path with an underscore or file extension.