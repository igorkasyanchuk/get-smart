## 🔄 Load and refresh data dynamically with AJAX

Use a JSON endpoint and Chartkick’s `refresh` option to keep your charts up to date without a full page reload. Define a controller action that renders data as JSON, then point Chartkick at that URL and set `refresh` in seconds.

```ruby
# routes.rb
get '/sales.json', to: 'sales#index'

# Controller (app/controllers/sales_controller.rb)
class SalesController < ApplicationController
  def index
    data = Sale.group_by_hour(:created_at, last: 24).sum(:amount)
    render json: data
  end
end

# View (ERB)
<%= line_chart "/sales.json",
  refresh: 60,
  xtitle: "Hour",
  ytitle: "Sales Amount"
%>
```