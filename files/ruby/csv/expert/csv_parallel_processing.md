## ⚡️ Parallelizing CSV Parsing with Concurrent Processing

Speed up large CSV workloads by distributing row chunks across threads using the `concurrent-ruby` gem. Batch rows with `Enumerable#each_slice` and post tasks to a thread pool, then wait for graceful shutdown.

```ruby
require 'csv'
require 'concurrent'

file = 'large.csv'
thread_count = 4
batch_size = 1000

pool = Concurrent::FixedThreadPool.new(thread_count)
CSV.foreach(file, headers: true).each_slice(batch_size) do |rows|
  pool.post(rows) do |chunk|
    chunk.each { |row| heavy_compute(row) }
  end
end
pool.shutdown
pool.wait_for_termination
```