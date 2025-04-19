## 🤝 Use Forwardable for Delegation

Instead of manually writing boilerplate methods to delegate calls to an internal object, leverage the Forwardable module. This makes your API clear and reduces repetition.

```ruby
require 'forwardable'

class Report
  extend Forwardable
  def_delegators :@summary, :title, :lines_count

  def initialize(summary)
    @summary = summary
  end
end

summary = OpenStruct.new(title: "Q1", lines_count: 42)
report  = Report.new(summary)
puts report.title       # Q1
puts report.lines_count # 42
```