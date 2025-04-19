## 🎨 Implement a Custom Reporter

Custom reporters allow you to tailor test output to your team’s needs, integrating progress bars, JUnit XML, or CI-friendly summaries. You can either use `minitest-reporters` or roll your own by subclassing `Minitest::AbstractReporter`.

```ruby
# Gemfile
gem 'minitest-reporters'
```

```ruby
# test_helper.rb
require 'minitest/reporters'
Minitest::Reporters.use! [
  Minitest::Reporters::ProgressReporter.new,
  Minitest::Reporters::JUnitReporter.new(report_dir: 'tmp/test-reports')
]
```

Or build a minimal custom reporter:
```ruby
require 'minitest'
class SummaryReporter < Minitest::AbstractReporter
  def record(result)
    puts "✅ #{result.name} (#{result.time.round(3)}s)"
  end
end
Minitest.reporter << SummaryReporter.new
```