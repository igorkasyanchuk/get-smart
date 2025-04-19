## 📝 Accessing Params

Controller actions use the `params` hash to read request data. Extract route and query parameters via symbol or string keys. Always validate and sanitize params before using them.

```ruby
class ArticlesController < ApplicationController
  def show
    id = params[:id]
    category = params[:category]
    @articles = Article.where(category: category)
  end
end
```