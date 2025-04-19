## 🧵 Craft Custom Generators with Fibers
Use fibers to build lazy enumerators that generate infinite or on‑the‑fly sequences. The fiber yields each element, and the Enumerator wraps it, supporting standard Enumerable methods without precomputing the full collection.

```ruby
def fib_generator
  Enumerator.new do |yielder|
    a, b = 0, 1
    Fiber.new do
      loop do
        yielder << a
        a, b = b, a + b
        Fiber.yield
      end
    end.resume
  end
end

gen = fib_generator
puts gen.take(10).inspect  # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```