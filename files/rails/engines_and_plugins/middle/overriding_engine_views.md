## ✨ Overriding Engine Views in the Host App

To customize engine-provided views without touching its source, simply create the same view path in your main app. Rails will load your view first.

```bash
# In your host app
mkdir -p app/views/blog_engine/posts
```

```erb
<!-- app/views/blog_engine/posts/index.html.erb -->
<h1>Customized Blog Posts</h1>
<%= render partial: 'shared/post', collection: @posts %>
```

This way, you preserve engine upgrades while tailoring templates to your application’s design.