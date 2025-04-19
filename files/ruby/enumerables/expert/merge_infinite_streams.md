## 🔀 Merging Infinite Sorted Streams with Enumerator and Fiber Orchestration

Merge two (or more) infinite sorted `Enumerator` streams by driving their fibers in lockstep. This pattern enables realtime, memory‐bounded merges in priority queues, event stream joins, or k‐way merges without materializing entire datasets.

```ruby
even = Enumerator.produce(0) { |n| n + 2 }
odd  = Enumerator.produce(1) { |n| n + 2 }

merged = Enumerator.new do |y|
  a, b = even.next, odd.next
  loop do
    if a < b
      y << a; a = even.next
    else
      y << b; b = odd.next
    end
  end
end

p merged.take(10)  # => [0,1,2,3,4,5,6,7,8,9]
```