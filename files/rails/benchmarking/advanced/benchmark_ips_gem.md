## 🏎️ Leverage benchmark-ips for Iterations-Per-Second
The `benchmark-ips` gem measures iterations per second, which is ideal for comparing algorithmic performance in Rails. Integrate it in a Rails console or script to see which implementation is fastest under concurrent load.

```ruby
# Gemfile
gem 'benchmark-ips'

# script/benchmark_ips.rb
require_relative '../config/environment'
require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('serializing JSON') do
    User.limit(1000).to_json
  end

  x.report('serializing Oj') do
    require 'oj'
    Oj.dump(User.limit(1000).as_json)
  end

  x.compare!
end
```