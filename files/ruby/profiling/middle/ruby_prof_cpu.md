## 🔍 CPU Profiling with ruby‑prof
The `ruby-prof` gem provides detailed call graphs and flat profiles showing time spent in each method. Start it before the code under test, stop it afterward, then choose a printer (flat, graph, call tree) to generate results. Filter out noise via `min_percent` to focus on hotspots.

```ruby
require 'ruby-prof'

RubyProf.start
# Code you want to profile
do_heavy_processing

result = RubyProf.stop
printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open('profile.html', 'w'), min_percent: 2)
```