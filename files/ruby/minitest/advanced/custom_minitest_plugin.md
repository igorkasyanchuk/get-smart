## 🧪 Build a Custom Minitest Plugin

Minitest plugins let you hook into the test runner lifecycle and add custom CLI flags, reporters, or behaviors. Create a file under `minitest/plugins` and define `Minitest.plugin_<name>_init` and `Minitest.plugin_<name>_options` methods to register your plugin.

```ruby
# minitest/plugins/trace_plugin.rb
require 'minitest'

def Minitest.plugin_trace_plugin_options(opts, _)
  opts.on "--trace-tests", "Print each test name before running" do
    @trace_tests = true
  end
end

def Minitest.plugin_trace_plugin_init(options)
  return unless options[:trace_tests]
  Minitest::Test.prepend(Module.new do
    def before_setup
      puts "Running: #{self.class}##{name}"
      super
    end
  end)
end
```

Now you can run:
```bash
$ ruby -rminitest/autorun test/**/*_test.rb -- --trace-tests
```