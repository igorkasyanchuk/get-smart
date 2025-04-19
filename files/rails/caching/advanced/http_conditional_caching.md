## 🌐 HTTP Conditional Caching with ETag & Last-Modified

Offload repeated view rendering by leveraging HTTP 304s with ETags and `Last-Modified` headers. Rails can automatically set ETags for your responses, enabling clients and proxies to skip fetching unchanged content.

```ruby
# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    fresh_when(etag: @article.cache_key_with_version, last_modified: @article.updated_at)
  end
end
```

With this, browsers will send `If-None-Match` or `If-Modified-Since`, and Rails will return `304 Not Modified` when appropriate, saving bandwidth and rendering time.