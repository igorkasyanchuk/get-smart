## 🔧 Generate a Resource Controller

Use the Rails generator to quickly scaffold an API-style controller with standard RESTful actions. This creates only the controller and skips views you won’t use.

```shell
# Generate Articles controller with index, show, create, update, destroy actions
$ rails generate controller Articles index show create update destroy --no-helper --no-assets --skip-routes
```  
```ruby
# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  # add create, update, destroy similarly
end
```