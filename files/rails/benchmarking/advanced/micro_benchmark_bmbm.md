## 🚀 Use Benchmark.bmbm for Accurate Micro-Benchmarks
Benchmark.bmbm runs your code twice—once to warm up the VM and once for actual measurement—giving more reliable comparisons by eliminating JIT and cache skew. Wrap your micro-benchmarks in a Rails runner or Rake task to load the full Rails environment.

```ruby
# lib/tasks/benchmarks.rake
task :bmbm => :environment do
  require 'benchmark'
  large_array = (1..100_000).to_a

  Benchmark.bmbm(15) do |x|
    x.report('map')     { large_array.map { |e| e * 2 } }
    x.report('collect') { large_array.collect { |e| e * 2 } }
    x.report('for')     { for e in large_array; e * 2; end }
  end
end
```
