## ⚙️ Parallel Map with Threads
Leverage Ruby threads to process array elements concurrently and speed up CPU-bound or I/O-bound tasks. This implementation uses a fixed-size thread pool to maintain order and limit resource usage.

```ruby
require 'thread'
require 'etc'

class Array
  def parallel_map(pool_size: Etc.nprocessors)
    queue   = SizedQueue.new(pool_size)
    results = []
    mutex   = Mutex.new

    workers = pool_size.times.map do
      Thread.new do
        while (item = queue.pop rescue nil)
          value, idx = item
          res = yield(value)
          mutex.synchronize { results << [idx, res] }
        end
      end
    end

    each.with_index { |elem, i| queue << [elem, i] }
    pool_size.times { queue.close }
    workers.each(&:join)

    results.sort_by(&:first).map(&:last)
  end
end

# Usage
results = [1,2,3,4].parallel_map { |n| expensive_operation(n) }
```