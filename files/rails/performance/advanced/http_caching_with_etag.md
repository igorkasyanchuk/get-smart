## 📈 HTTP Caching with ETag and Freshness

Leverage ETag and `Last-Modified` headers to enable client-side caching and reduce server load. Use `fresh_when` or `stale?` in controllers to automatically set these headers and return a `304 Not Modified` when appropriate.

```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    # Sets ETag and Last-Modified based on record
    fresh_when(etag: @article.cache_key_with_version, last_modified: @article.updated_at)
  end
end
```