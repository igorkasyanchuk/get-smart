## 🌐 Responding to Different Formats

Rails controllers can respond to HTML, JSON, XML, and more with `respond_to`. Wrap your render or redirect calls in a block to handle each format appropriately.

```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end
end
```