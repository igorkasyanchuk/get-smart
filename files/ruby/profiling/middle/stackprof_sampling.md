## 🧵 Sampling Profiles with StackProf
`stackprof` runs a statistical sampler over your code, offering low overhead and easy integration. Configure mode (`:cpu`, `:wall`, or `:object`), sampling interval, and output file. Later inspect with text or flamegraph printers to find performance bottlenecks.

```ruby
require 'stackprof'

StackProf.run(mode: :cpu, interval: 1000, out: 'tmp/stackprof-cpu.dump') do
  perform_complex_task
end

report = StackProf::Report.new('tmp/stackprof-cpu.dump')
report.print_text(%i[samples self])
```