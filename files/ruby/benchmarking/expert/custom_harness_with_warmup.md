## ⚙️ Build a Custom Benchmarking Harness with Warmup and Teardown

For enterprise-grade services, you need benchmarks that reflect real-world workloads. Implement a harness that runs multiple warmup cycles, triggers full GC, and collects metrics at each stage to isolate JIT/bytecode cache effects.

```ruby
class BenchmarkHarness
  def initialize(iterations:, warmup_cycles:)
    @iterations = iterations
    @warmup_cycles = warmup_cycles
    @results = []
  end

  def run
    @warmup_cycles.times { GC.start }
    @warmup_cycles.times { yield }  # warmup

    @iterations.times do |i|
      GC.start(full_mark: true, immediate_sweep: true)
      t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      yield
      t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      @results << (t1 - t0)
    end
    summarize
  end

  def summarize
    avg = @results.sum / @results.size
    sd = Math.sqrt(@results.map { |x| (x - avg)**2 }.sum / @results.size)
    { average: avg, std_dev: sd, samples: @results.size }
  end
end

# Usage
harness = BenchmarkHarness.new(iterations: 50, warmup_cycles: 10)
stats = harness.run { MyService.call(payload) }
puts stats
```
