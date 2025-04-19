## 🖋 Implement a Custom Formatter for Domain Reports
Extend RSpec::Core::Formatters::BaseFormatter to generate domain‑specific reports (e.g., test coverage by feature). Hook into `example_passed`, `example_failed`, and `dump_summary` to accumulate metrics.

```ruby
# lib/rspec/formatters/feature_reporter.rb
require 'rspec/core/formatters/base_formatter'
module RSpec
  module Formatters
    class FeatureReporter < BaseFormatter
      RSpec::Core::Formatters.register self, :example_passed, :dump_summary

      def initialize(output)
        super
        @features = Hash.new(0)
      end

      def example_passed(notification)
        feature = notification.example.metadata[:feature]
        @features[feature] += 1 if feature
      end

      def dump_summary(summary)
        output.puts "\nFeature Test Counts:" \
          "\n" + @features.map { |f, c| "#{f}: #{c}" }.join("\n")
      end
    end
  end
end

# .rspec
--require spec_helper
--format RSpec::Formatters::FeatureReporter
```