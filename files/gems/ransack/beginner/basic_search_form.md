## 🔍 Basic Search Form Setup
Add a search form using Ransack’s built‑in helpers. This lets you generate a form bound to a Ransack `@q` object in your controller, so search parameters are preserved automatically.

```erb
<%= search_form_for @q, url: products_path, method: :get do |f| %>
  <div>
    <%= f.label :name_cont, "Name contains" %>
    <%= f.search_field :name_cont %>
  </div>
  <div>
    <%= f.submit "Search" %>
  </div>
<% end %>
```

In your controller:

```ruby
class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
  end
end
```