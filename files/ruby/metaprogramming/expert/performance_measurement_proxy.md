## ⏱️ Performance Measurement Proxy Generation

Dynamically generate a proxy class that wraps all public methods to measure execution time. Use `Module#define_method` in combination with `instance_methods` to inject timing logic into each method at load time.

```ruby
module PerfProxy
  def self.wrap(klass)
    proxy = Class.new(klass) do
      klass.instance_methods(false).each do |m|
        define_method(m) do |*args, &blk|
          start = Time.now
          result = super(*args, &blk)
          duration = Time.now - start
          puts "#{m} executed in #{(duration*1000).round(2)}ms"
          result
        end
      end
    end
    proxy
  end
end

class Worker
  def perform; sleep(0.01); end
end

PerfWorker = PerfProxy.wrap(Worker)
PerfWorker.new.perform  # => "perform executed in 10.05ms"
```