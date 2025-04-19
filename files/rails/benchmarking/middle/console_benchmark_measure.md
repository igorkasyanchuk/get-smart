## 🐢 Benchmark Code Blocks in Rails Console

Use Ruby’s built‑in `Benchmark.measure` in the Rails console to quickly compare different implementations. This is ideal for spotting slow code paths without restarting your server.

```ruby
# Launch Rails console with: bin/rails console
require 'benchmark'

Benchmark.measure do
  # Compare two ways of fetching users
  1000.times { User.where(active: true).pluck(:id) }
end

Benchmark.measure do
  1000.times { User.where(active: true).pluck(:id).map(&:to_i) }
end
```

Each `Benchmark.measure` block returns an object containing user, system, total, and real time. Use these metrics to decide which approach is faster.