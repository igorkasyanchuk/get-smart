## 📈 Benchmark Regex Performance
Incorporate `Benchmark` or `benchmark/ips` to measure and compare regex variants. Tweak patterns to avoid backtracking, leverage atomic groups, and quantify improvements in real scenarios.

```ruby
require 'benchmark'
str = 'a' * 100 + 'b'
patterns = {
  simple: /(a+)+b/, 
  atomic:  /(?>a+)+b/
}
Benchmark.bm do |bm|
  patterns.each do |name, rx|
    bm.report(name) { 100_000.times { rx =~ str } }
  end
end
```