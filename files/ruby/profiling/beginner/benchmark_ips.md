## ⚡️ Use benchmark-ips for iterations per second

The `benchmark-ips` gem focuses on throughput by reporting iterations per second, which is great for tight loops. Install it with `gem install benchmark-ips`, then write a simple script to see which implementation gives more ops/sec.

```ruby
# Gemfile
# gem 'benchmark-ips'

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("times")   { 1000.times { Math.sqrt(123.456) } }
  x.report("pow")     { 1000.times { 123.456 ** 0.5 } }
  x.compare!
end
```