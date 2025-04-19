## 🎉 Setting Up a Basic Controller

In Rails, controllers inherit from `ApplicationController` and group related actions. To create a controller, use the generator and define your methods. Each public method becomes an action that can respond to requests.

```bash
$ rails generate controller Articles index show new create
```

```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
```