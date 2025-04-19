## 📝 Log Timings with Rails.logger.benchmark

Rails extends the logger with `benchmark` to log execution time directly in your logs. Wrap any block in controllers, models, or jobs to automatically output timing info without extra setup.

```ruby
class ProductsController < ApplicationController
  def index
    Rails.logger.benchmark("Loading products") do
      @products = Product.all.to_a
    end
    render json: @products
  end
end

# Logs: [Benchmark][Loading products]    0.045678   (  0.047890)
```
