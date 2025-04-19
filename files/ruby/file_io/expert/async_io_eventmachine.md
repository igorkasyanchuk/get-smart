## ⚡️ Use Async I/O Libraries for Concurrent File Operations
Ruby’s native threads suffer from GIL constraints; for truly concurrent file I/O, adopt an evented framework such as `async` or EventMachine with reactor-based file handling.

```ruby
require 'async/io'

Async do |task|
  file = Async::IO::File.new('big.log', 'r')
  buffer = ''

  while chunk = file.read(4096)
    # offload CPU work to thread pool
    task.async do |subtask|
      parse_and_index(chunk)
    end
  end

  file.close
end
```

This design achieves high throughput by overlapping async disk reads with CPU-bound parsing tasks, maximizing resource utilization.