## 🔍 Instrumentation via Module#prepend

Use `Module#prepend` to inject behavior before or after target methods without altering the original class. This approach ensures your instrumentation runs in the proper ancestor chain and can call `super` to delegate to the original implementation.

```ruby
module MethodProfiler
  def self.prepended(base)
    base.instance_methods(false).each { |m| wrap_method(base, m) }
  end

  def self.wrap_method(base, method)
    base.define_method(method) do |*args, &blk|
      start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      result = super(*args, &blk)
      duration = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
      puts "#{method} took #{duration.round(4)}s"
      result
    end
  end
end

class DataFetcher
  def fetch; sleep(0.1); 'data'; end
  prepend MethodProfiler
end

DataFetcher.new.fetch  # Outputs: "fetch took 0.1001s"
```