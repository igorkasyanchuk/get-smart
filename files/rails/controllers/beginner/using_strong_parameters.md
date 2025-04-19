## 🔒 Using Strong Parameters

Strong parameters protect your app from unwanted attribute assignment. In your controller, whitelist attributes using private methods. Always use `require` and `permit` to filter params before mass assignment.

```ruby
class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
```