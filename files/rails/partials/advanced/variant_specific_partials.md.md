## 🧩 Rendering Variant-Specific Partials
Rails supports `request.variant` to serve different partials based on the client (e.g., `:mobile`, `:desktop`). Define files with the `+variant` suffix and Rails will pick the correct one automatically, simplifying responsive rendering logic.

```ruby
# app/controllers/application_controller.rb
before_action do
  request.variant = :mobile if browser.mobile?
end
```

```erb
<%# app/views/articles/_show.html+mobile.erb %>
<div class="article-mobile">
  <h1><%= article.title %></h1>
  <p><%= article.body.truncate(200) %></p>
</div>
```

```erb
<%# app/views/articles/_show.html.erb %>
<div class="article-desktop">
  <h1><%= article.title %></h1>
  <p><%= article.body %></p>
</div>
```