## ⚡ Profile Code Snippets with StackProf or Benchmark
Leverage `StackProf` or Ruby’s `Benchmark` in the console to identify performance hotspots in isolated code paths. You can require profiling libraries on the fly and inspect flamegraphs or report summaries directly.

```ruby
# Inside rails console
require 'stackprof'

StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu.dump') do
  User.where(active: true).includes(:orders).each do |u|
    u.orders.map(&:total).sum
  end
end

puts "🔥 Dump written to tmp/stackprof-cpu.dump"
# Then visualize with: stackprof tmp/stackprof-cpu.dump --flamegraph > tmp/flamegraph.html
```

Alternatively, use `Benchmark` for quick per-iteration insights:

```ruby
require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("no index") { User.where('created_at > ?', 1.week.ago).to_a }
  x.report("with index") { User.where(created_at: 1.week.ago..Time.current).to_a }
  x.compare!
end
```