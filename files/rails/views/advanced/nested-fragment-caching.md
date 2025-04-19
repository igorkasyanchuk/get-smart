## 📦 Tip: Combine Fragment Caching with `cache_version` for Nested Expiration
Use `cache_version` on parent records to expire all nested fragments when a root object changes. This gives you fine-grained control over when inner caches should be invalidated.

Example:

```ruby
# app/models/article.rb
class Article < ApplicationRecord
  has_many :comments

  def cache_version
    [updated_at, comments.maximum(:updated_at)]
  end
end
``` 
```erb
<% cache @article, version: @article.cache_version do %>
  <%= render 'header', article: @article %>
  <%= render @article.comments %>
<% end %>
```