## ⏱️ Using Before Action Filters

Before actions let you run code before specified controller actions. Commonly used for authentication or finding resources. Use `before_action` and limit it with `only` or `except` options.

```ruby
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show; end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
```