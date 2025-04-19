## 🔄 Rendering JSON Responses

APIs often need JSON output instead of HTML. Use `render json:` to serialize objects automatically. You can customize which fields to include for clarity.

```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles, only: [:id, :title, :created_at]
  end
end
```