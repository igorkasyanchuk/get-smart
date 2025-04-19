## 🔄 Glide Through Data Pipelines with Fibers
You can build high‑performance data pipelines by chaining fibers that push and pull chunks of data, minimizing memory overhead. Each stage yields output to the next, allowing backpressure and streaming of large files or network data without loading it all into memory.

```ruby
# Producer fiber reads lines
producer = Fiber.new do
  File.foreach("large.log") do |line|
    Fiber.yield line.upcase
  end
  nil
end

# Consumer fiber transforms and writes
consumer = Fiber.new do
  while chunk = producer.resume
    processed = chunk.gsub(/ERROR/, "WARN")
    Fiber.yield processed
  end
end

# Runner pulls from consumer
while out = consumer.resume
  puts out
end
```