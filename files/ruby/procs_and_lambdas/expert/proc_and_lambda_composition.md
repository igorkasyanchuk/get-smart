## ⚙️ Composing Procs and Lambdas into Pipelines
Complex data transformations become elegant pipelines by composing small procs. Define a `compose` helper that chains callables, allowing left-to-right or right-to-left execution for clear, functional-style code.

```ruby
def compose(*fns)
  ->(input) { fns.reduce(input) { |acc, fn| fn.call(acc) } }
end

strip = ->(s) { s.strip }
downcase = ->(s) { s.downcase }
exclaim = ->(s) { "#{s}!" }

pipeline = compose(strip, downcase, exclaim)
puts pipeline.call("  HeLLo WOrLd  ")  # => "hello world!"
```

Use `#curry` with composition to inject configuration objects or context seamlessly.