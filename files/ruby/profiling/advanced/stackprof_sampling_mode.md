## ⚙️ Sampling Profiling with StackProf in Production

StackProf leverages statistical sampling to profile production workloads with minimal overhead. By choosing between `:cpu`, `:wall`, or `:object` modes and tuning the interval, you can capture representative call stacks without crippling performance.

```ruby
# Gemfile
# gem 'stackprof'

require 'stackprof'

StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu.dump', interval: 1000) do
  # The code path under real traffic or test harness
  MyApp.start
end

# Analyze results later
# shell> stackprof tmp/stackprof-cpu.dump --text
# shell> stackprof tmp/stackprof-cpu.dump --flamegraph > stackprof.html
```