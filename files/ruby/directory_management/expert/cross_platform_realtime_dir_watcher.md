## 🔍 Cross-Platform Real-Time Directory Watcher with Event Batching

Building a robust watcher requires handling different backends (inotify, FSEvents, Windows APIs) and coalescing noisy events (e.g., editor temp writes). This example uses `rb-inotify` on Linux and `rb-fsevent` on macOS, unified under a concurrent queue with batch de‑duplication.

```ruby
require 'rb-inotify'
require 'rb-fsevent'
require 'concurrent-ruby'

class DirectoryWatcher
  def initialize(paths)
    @paths = Array(paths)
    @queue = Concurrent::Array.new
    @mutex = Mutex.new
  end

  def run
    if RUBY_PLATFORM =~ /darwin/
      @watcher = FSEvent.new
      @watcher.watch(@paths, file_events: true) { |directories| enqueue(directories) }
      @watcher.run
    else
      notifier = INotify::Notifier.new
      @paths.each { |p| notifier.watch(p, :modify, :create, :delete, :move) { |e| enqueue([e.name]) } }
      notifier.run!
    end

    process_batches
  end

  private

  def enqueue(events)
    @mutex.synchronize { @queue.concat(Array(events)) }
  end

  def process_batches
    loop do
      sleep 0.5
      @mutex.synchronize do
        next if @queue.empty?
        batch = @queue.uniq
        @queue.clear
        handle_batch(batch)
      end
    end
  end

  def handle_batch(batch)
    batch.each do |file|
      # your custom logic: reload, sync, backup, etc.
      puts "Detected change in: ", file
    end
  end
end

# Usage:
DirectoryWatcher.new('/srv/shared_assets').run
```

This structure:
- Adapts to platform-specific APIs.
- Collects events into a concurrent array.
- Coalesces duplicates every 0.5s to avoid thrash.
- Processes each unique path in bulk, enabling batched actions.