## ⚡ HTTP Caching with ETags and Conditional GET

Reduce payload and server load by leveraging ETags and conditional GET. Use `fresh_when` in your API controllers and configure `Rack::Cache` or a CDN to respect `Cache-Control` headers. This setup will automatically return `304 Not Modified` when possible.

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.action_dispatch.rack_cache = {
    verbose:     false,
    metastore:   "redis://localhost:6379/1/metastore",
    entitystore: "redis://localhost:6379/1/entitystore"
  }
end

# app/controllers/api/v1/articles_controller.rb
class Api::V1::ArticlesController < ApplicationController
  def show
    article = Article.find(params[:id])
    fresh_when(etag: article, last_modified: article.updated_at, public: true)
    return head :not_modified if stale?(etag: article)

    render json: ArticleSerializer.new(article).serializable_hash
  end
end
```