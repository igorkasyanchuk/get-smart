## ⚡️ Turbo-Charge API Responses with Conditional GET (`ETag` & `Last-Modified`)

Combine Rails’ HTTP caching with your JSON endpoints to avoid rendering or sending payloads when clients already have fresh data. Use `stale?` or `fresh_when` in controllers.

```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    fresh_when(etag: @article.cache_key_with_version, last_modified: @article.updated_at)
    # Rails returns 304 Not Modified if appropriate, skipping view/render
  end
end
```

You can also use `expires_in` and `public: true` to set `Cache-Control` headers for proxies and clients.