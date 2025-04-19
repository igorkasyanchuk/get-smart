## 🌍 Integrate Mustache Templates for Client-side Rendering
Precompile Mustache/Handlebars templates server-side then render in views to minimize JS bundling and leverage existing Ruby data transforms.

```ruby
# config/initializers/mustache.rb
Mustache.template_path = Rails.root.join('app', 'views', 'mustache')
```

In view:
```erb
<script id="comment-template" type="x-tmpl-mustache">
  {{#comments}}
    <p>{{ author }}: {{ body }}</p>
  {{/comments}}
</script>
<script>
  const template = Mustache.compile(document.getElementById('comment-template').innerHTML)
  document.getElementById('comments').innerHTML = template({ comments: <%= raw @comments.to_json %> })
</script>
```