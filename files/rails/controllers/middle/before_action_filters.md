## ⚙️ Organize with before_action Filters
Use `before_action` callbacks to DRY up repetitive setup code in controllers. This keeps actions clean and focused by extracting shared logic like authentication or resource loading. Simply declare filters at the top of the controller and apply them to specific actions.

```ruby
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
```