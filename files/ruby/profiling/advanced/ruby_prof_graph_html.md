## 🔍 Generating Interactive Call-Graph HTML

RubyProf’s GraphHtmlPrinter produces an interactive HTML report you can explore in a browser to navigate call relationships and inclusive vs. exclusive times. Adjust the `min_percent` threshold to filter noise and focus on methods that dominate runtime.

```ruby
require 'ruby-prof'

RubyProf.start(mode: RubyProf::WALL_TIME)
# Your heavy workload here
result = RubyProf.stop

printer = RubyProf::GraphHtmlPrinter.new(result)
File.open('profile_graph.html', 'w') do |file|
  printer.print(file, min_percent: 2.0)
end
puts 'Open profile_graph.html in your browser!'
```