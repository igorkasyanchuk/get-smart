## ➡️ Redirecting After Actions

After operations like create or update, redirect to another page to avoid duplicate submissions. Use `redirect_to` with path helpers for clarity. Optionally, pass a notice to show a flash message.

```ruby
class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end
end
```