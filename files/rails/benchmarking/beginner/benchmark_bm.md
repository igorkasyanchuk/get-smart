## 📊 Format Multiple Measurements with Benchmark.bm

When you need to compare multiple code blocks, `Benchmark.bm` prints a neat table with aligned labels. Pass an integer width to control label padding and get side-by-side timing results.

```ruby
require 'benchmark'

Benchmark.bm(15) do |x|
  x.report("Load users")    { User.all.to_a }
  x.report("Load orders")   { Order.all.to_a }
  x.report("Load products") { Product.includes(:category).to_a }
end

# =>                       user     system      total        real
# => Load users         0.020000   0.000000   0.020000 (  0.022345)
# => Load orders        0.015000   0.000000   0.015000 (  0.017890)
# => Load products      0.030000   0.000000   0.030000 (  0.033456)
```
