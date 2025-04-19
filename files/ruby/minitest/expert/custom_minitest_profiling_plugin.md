## 🛠️ Custom Minitest Profiling Plugin

Create a Minitest plugin to hook into the runner lifecycle, profile test durations, and optionally filter or reorder tests. By extending `Minitest.plugin_*` methods you can inject custom reporters or modify the test queue before execution.

```ruby
# lib/minitest/profiling_plugin.rb
def Minitest.plugin_profiling_init(options)
  require 'minitest/reporters'
  Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
end

def Minitest.plugin_profiling_reporter(options)
  Module.new do
    def record(result)
      super
      @times ||= []
      @times << [result.name, result.time]
    end

    def report
      super
      puts "\nSlowest Tests:".bold
      @times.sort_by(&:last).last(5).each do |name, time|
        puts "#{format('%.4f', time)}s  #{name}"
      end
    end
  end.tap { |r| Minitest.reporter.reporters << r.new }
end
```

Then require your plugin when running:  
```bash
ruby -r ./lib/minitest/profiling_plugin.rb -Ilib:test test/**/*_test.rb
```