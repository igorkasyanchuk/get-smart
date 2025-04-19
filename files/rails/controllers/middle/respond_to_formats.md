## 🔄 Handle Multiple Response Formats
Rails controllers can respond to different formats (HTML, JSON, XML) using `respond_to`. This makes your endpoints flexible for web pages and API clients. Use `format` blocks inside actions to render the appropriate response based on the request's `Accept` header.

```ruby
class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html # renders index.html.erb
      format.json { render json: @products }
    end
  end
end
```