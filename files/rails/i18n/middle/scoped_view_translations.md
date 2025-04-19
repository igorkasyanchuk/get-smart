## 🏷️ Scoped View Translations

In Rails views you can use `t('.key')` to automatically scope translation keys to the current template path. This keeps your keys concise and avoids repetition of full scope names.

```erb
<!-- app/views/posts/index.html.erb -->
<h1><%= t('.title') %></h1>
<p><%= t('.subtitle') %></p>
```

```yaml
# config/locales/en.yml
en:
  posts:
    index:
      title: "All Posts"
      subtitle: "Latest articles from our blog"
```