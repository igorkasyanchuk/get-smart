## 🛠️ Flat-Printer Profiling with ruby-prof

Leverage ruby-prof’s FlatPrinter to obtain a straightforward CPU-time breakdown per method, helping you pinpoint the slowest routines at a glance. This mode is ideal for large codebases where you need an overview of hotspots without call-graph complexity.

```ruby
require 'ruby-prof'

RubyProf.start
# Execute the code path you want to analyze
result = RubyProf.stop

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
```