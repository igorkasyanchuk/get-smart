## 🔥 Generating Flamegraphs with StackProf and FlameGraph

Combine StackProf’s sampling profiler with Brendan Gregg’s FlameGraph scripts to produce an interactive SVG flamegraph. This approach surfaces CPU hotspots over time and makes it easy to spot unexpected heavy call stacks.

```ruby
# Gemfile: gem 'stackprof'
require 'stackprof'

StackProf.run(mode: :cpu, interval: 1000, out: 'tmp/stackprof-cpu.dump') do
  # Your multi-layered app logic
  1_000_000.times { [1,2,3].map(&:to_s) }
end
```

Then generate the flamegraph:
```bash
gem install flamegraph # if needed
stackprof tmp/stackprof-cpu.dump --flame > tmp/flamegraph.svg
open tmp/flamegraph.svg
```