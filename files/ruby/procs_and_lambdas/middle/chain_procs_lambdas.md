## ➿ Chain Procs and Lambdas for Pipelines
You can compose multiple Procs or lambdas into a processing pipeline to transform data step by step. This pattern improves readability and separates concerns. Use `Enumerable#inject` or define a helper to chain them.

```ruby
pipeline = [
  Proc.new { |x| x * 2 },
  ->(x) { x + 3 },
  ->(x) { x / 5 }
]

result = pipeline.inject(10) { |acc, fn| fn.call(acc) }
puts result   # ((10*2)+3)/5 = 4
```