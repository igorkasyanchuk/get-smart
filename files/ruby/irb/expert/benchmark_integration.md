## ⏱️ Automatic Benchmarking Wrapper
Wrap each entered expression in a `Benchmark.measure` to instantly see performance metrics for your exploratory code.

```ruby
require 'benchmark'
module IRB
  class InputTransformer
    def transform(line)
      "Benchmark.measure { #{line} }.tap { |bm| puts bm }"
    end
  end
end
```

Every time you type an expression, IRB prints the elapsed time, allocations, and GC stats. Tweak the transformer to filter heavy operations and suppress trivial ones.