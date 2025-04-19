## 🗂️ Cache Controller Actions with Russian Doll Caching
Combine low-level controller caching with view-level fragment caching to improve performance. Use `cache` in views and `fresh_when` or `stale?` in controllers.

```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    fresh_when(@article) # Sets ETag and Last-Modified headers
  end
end
```

In the view:
```erb
<% cache @article do %>
  <h1><%= @article.title %></h1>
  <% cache [@article, @article.comments] do %>
    <%= render @article.comments %>
  <% end %>
<% end %>
```