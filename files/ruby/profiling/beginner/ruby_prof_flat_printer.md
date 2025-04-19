## 🔍 Profile with ruby-prof flat printer

The `ruby-prof` gem provides detailed call graphs and flat reports. Install it with `gem install ruby-prof`, then wrap your code in a profiler block and print a flat report.

```ruby
require 'ruby-prof'

RubyProf.start
# Code to profile
1000.times { Math.sqrt(123.456) }
result = RubyProf.stop

# Print flat profile to STDOUT
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
```