## 📈 Generating Flamegraphs for Visual Insight
Convert your `stackprof` dumps into interactive flamegraphs to quickly spot hot call stacks. After capturing a raw dump, feed it into the `flamegraph` gem or offline tool to produce an HTML visualization you can open in a browser.

```ruby
require 'stackprof'
require 'flamegraph'

StackProf.run(mode: :cpu, out: 'tmp/stackprof.dump') do
  process_large_dataset
end

data = Marshal.load(File.read('tmp/stackprof.dump'))
Flamegraph.generate('tmp/flamegraph.html') do
  Flamegraph::Printer.new(data).print
end
```