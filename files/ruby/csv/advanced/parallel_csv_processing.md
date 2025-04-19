## ⚙️ Parallel CSV Processing with Thread Pool

To speed up CPU-bound transformations on CSV data, divide rows into chunks and process them concurrently with a thread pool. This pattern maximizes CPU utilization while keeping memory usage bounded by chunk size.

```ruby
require 'csv'
require 'concurrent-ruby'

pool = Concurrent::FixedThreadPool.new(4)
CSV.open('large.csv', headers: true).each_slice(5_000) do |slice|
  pool.post do
    slice.each { |row| heavy_transform(row) }
  end
end
pool.shutdown
pool.wait_for_termination
```

Here, `each_slice` segments the file, and `FixedThreadPool` processes each slice in parallel. Adjust pool size and slice length to match your CPU and memory constraints.