## 📊 Generating Flamegraphs with perftools.rb

Combine perftools.rb with Brendan Gregg’s FlameGraph tool to produce vivid flamegraphs for CPU and allocation profiles. Flamegraphs make it easy to spot deep call stacks and costly methods at a single glance.

```bash
# Install prerequisites
gem install perftools.rb
gem install flamegraph

# Profile Ruby code execution
ruby -r perftools -e "PerfTools.start(file: 'tmp/perf-cpu') { MyApp.run }"

# Convert to flamegraph (requires flamegraph script in PATH)
flamegraph-perf tmp/perf-cpu > tmp/cpu_flamegraph.html
open tmp/cpu_flamegraph.html
```