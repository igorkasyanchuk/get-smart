## ⚡️ Use Benchmark.ips for Iteration‑Per‑Second Metrics

For more robust performance profiling, use the `benchmark-ips` gem. It measures how many iterations per second your code can execute, smoothing out noise.

```ruby
# Add to Gemfile: gem 'benchmark-ips'
require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('string concat +') { 10_000.times { 'a' + 'b' } }
  x.report('string <<') { 10_000.times { s = ''; s << 'a'; s << 'b' } }
  x.compare!
end
``` 

`benchmark-ips` runs warm‑up and measure phases, then prints relative performance. Use this when you need statistically significant comparisons.