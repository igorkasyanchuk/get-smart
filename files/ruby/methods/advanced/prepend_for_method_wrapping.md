## 🧩 Method Wrapping with `Module#prepend`
`prepend` offers more predictable and safer method wrapping than `alias_method_chain`. Prepending a module places its methods before the original, making super calls chain naturally.

```ruby
module PerformanceMonitor
  def compute(x)
    start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = super
    duration = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
    puts "compute took #{duration.round(3)}s"
    result
  end
end

class HeavyCalculator
  prepend PerformanceMonitor

  def compute(x)
    sleep(0.2)
    x * x
  end
end

HeavyCalculator.new.compute(5)
```