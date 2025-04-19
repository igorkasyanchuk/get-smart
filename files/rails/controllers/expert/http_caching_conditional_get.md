## 🗂 HTTP Caching with stale? and fresh_when

Improve performance by leveraging HTTP conditional requests. Use `fresh_when` or `stale?` in your action to automatically set ETag and Last-Modified headers. Rails will handle returning `304 Not Modified` when appropriate.

```ruby
class ArticlesController < ApplicationController
  def show
    article = Article.find(params[:id])
    fresh_when(etag: article, last_modified: article.updated_at, public: true) or return

    render json: article
  end
end
```