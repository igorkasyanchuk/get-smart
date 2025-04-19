## 🏎️ Lazy Parallel Directory Traversal

When working with massive directory trees, loading all paths into memory can be prohibitive. By combining `Dir.glob` with `Enumerator::Lazy` and `concurrent-ruby`, you can stream file paths and process them concurrently without blowing out RAM.

1. Use `Dir.glob` and wrap it in a lazy enumerator.
2. Create a `Concurrent::ThreadPoolExecutor` to throttle parallel work.
3. Dispatch each path as a lightweight `Concurrent::Promise` and handle results as they complete.

```ruby
require 'concurrent-ruby'

lazy_paths = Dir.glob("/var/data/**/*").lazy
executor   = Concurrent::ThreadPoolExecutor.new(
  min_threads: 2,
  max_threads: 8,
  max_queue: 1000,
  fallback_policy: :caller_runs
)

# Process only .log files in parallel
lazy_paths
  .select { |p| p.end_with?(".log") }
  .each do |path|
    Concurrent::Promise.execute(executor: executor) do
      # heavy I/O or CPU-bound operation
      size = File.size(path)
      # e.g., archive or analyze
      { path: path, bytes: size }
    end.then do |result|
      puts "Processed #{result[:path]} (#{result[:bytes]} bytes)"
    end
  end

# Ensure all tasks finish
executor.shutdown
executor.wait_for_termination
```