## 📊 Comparing Multiple Snippets with Benchmark.bm

`Benchmark.bm` prints a neat table comparing several code blocks. Pass a width for the label column, then call `report` for each scenario. This is great for side‑by‑side performance checks.

```ruby
require 'benchmark'

Benchmark.bm(12) do |x|
  x.report("times loop") { 1_000_000.times { |i| i * 2 } }
  x.report("for loop  ") do
    for i in 1..1_000_000
      i * 2
    end
  end
end
```
