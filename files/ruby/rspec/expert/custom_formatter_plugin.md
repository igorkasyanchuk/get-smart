## 📦 Building a Custom Formatter Plugin

Hook into RSpec's formatter API to build a custom reporter—e.g., exporting a JSON summary of failures, durations, and example metadata. Register for notifications and implement the desired output logic.

```ruby
# lib/rspec/json_formatter.rb
require 'rspec/core/formatters/base_text_formatter'

class RSpec::JsonFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :dump_summary

  def initialize(output)
    super
    @results = { examples: [] }
  end

  def example_passed(notification)
    @results[:examples] << format_example(notification.example, 'passed')
  end

  def example_failed(notification)
    @results[:examples] << format_example(notification.example, 'failed')
  end

  def dump_summary(summary)
    @results[:summary] = {
      duration: summary.duration,
      example_count: summary.example_count,
      failure_count: summary.failure_count
    }
    output.puts JSON.pretty_generate(@results)
  end

  private

  def format_example(example, status)
    {
      full_description: example.full_description,
      file_path: example.metadata[:file_path],
      status: status,
      run_time: example.execution_result.run_time
    }
  end
end
```

```ruby
# .rspec
--require lib/rspec/json_formatter.rb
--format RSpec::JsonFormatter
```
