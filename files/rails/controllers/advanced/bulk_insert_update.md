## ⚙️ Use Bulk Insert and Update in Controllers
For high-volume data, minimize SQL calls with `insert_all` and `upsert_all`. These methods bypass validations, so sanitize inputs carefully.

```ruby
class ImportsController < ApplicationController
  def create
    records = params[:items].map { |item| item.permit(:name, :price).to_h }
    Product.insert_all(records)
    head :created
  end

  def bulk_upsert
    records = params[:items].map { |item| item.permit(:sku, :stock).to_h }
    Product.upsert_all(records, unique_by: :sku)
    head :ok
  end
end
```