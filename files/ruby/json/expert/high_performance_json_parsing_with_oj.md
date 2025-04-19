## ⚡ High-Performance JSON Parsing with Oj

Oj is a blazing-fast JSON parser and serializer implemented in C. Using its strict, object, or Rails compatibility modes and fine-tuned options such as `symbol_keys`, `bigdecimal_load`, and `mode` can drastically improve throughput in CPU-bound workloads. Here's how to configure and benchmark Oj against the stdlib JSON:

```ruby
require 'oj'
require 'json'

# Configure Oj for Rails compatibility:
Oj.default_options = {
  mode: :compat,       # make Oj behave like JSON gem
  symbol_keys: true,   # parse keys to symbols
  bigdecimal_load: :bigdecimal, # preserve precision
  use_to_json: true    # fallback to obj.to_json if defined
}

# Sample payload
payload = File.read('large.json')

# Benchmark
require 'benchmark'
Benchmark.bm(10) do |x|
  x.report('stdlib JSON') { JSON.parse(payload) }
  x.report('Oj parse')   { Oj.load(payload) }
end
``` 

Experiment with `mode: :strict`, `:object`, and `:null` to balance conformance versus performance, and tune `int_precision` or `float_precision` for numeric accuracy optimizations.