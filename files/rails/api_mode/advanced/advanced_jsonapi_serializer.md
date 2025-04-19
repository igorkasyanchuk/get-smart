## 🚀 Advanced JSON:API Serialization

Leverage the `jsonapi-serializer` gem for blazing‑fast serialization with support for relationships, sparse fieldsets, and caching. Predefine `cache_options` to avoid repeated allocations and embed polymorphic associations gracefully.

```ruby
# app/serializers/article_serializer.rb
class ArticleSerializer
  include JSONAPI::Serializer
  set_type :article
  set_id :uuid  # use UUID or custom key

  attributes :title, :published_at
  belongs_to :author, serializer: UserSerializer
  has_many :comments

  # Enable fragment caching for each record
  cache_options store: Rails.cache, namespace: 'jsonapi', expires_in: 1.hour
end

# Controller
class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.includes(:author, :comments).page(params[:page])
    render json: ArticleSerializer.new(articles, include: %i[author comments]).serializable_hash
  end
end
```