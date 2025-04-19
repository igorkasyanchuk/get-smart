## 🚀 Reuse string buffers with String#replace

Allocating fresh strings in hot loops can trigger GC churn. By pre‑allocating a single buffer and using `String#replace`, you overwrite its content without reallocating the object. This technique is critical in high‑throughput parsing or formatting workloads.

```ruby
buffer = String.new
100_000.times do |i|
  buffer.replace(i.to_s)
  process(buffer)  # do something CPU-bound with the string
end
# `buffer` object_id stays constant, avoiding temporary allocations
```