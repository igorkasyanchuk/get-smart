## 🛑 Graceful Thread Shutdown and Resource Cleanup

Implement a shutdown flag and `Thread#join` with timeout to stop workers cleanly, releasing DB connections or file handles in `ensure` blocks.

```ruby
class Worker
  def initialize
    @stop = false
    @thread = Thread.new { work_loop }
  end

  def work_loop
    until @stop
      begin
        # Process job
        job = fetch_job
        job.process
      ensure
        cleanup_resources
      end
    end
  end

  def shutdown(timeout: 5)
    @stop = true
    @thread.join(timeout)
    unless @thread.stop?
      # Force kill if unresponsive
      @thread.kill
    end
  end

  private

  def fetch_job
    # thread-safe fetch...
  end

  def cleanup_resources
    # e.g., ActiveRecord::Base.clear_active_connections!
  end
end

# Usage
worker = Worker.new
# ... later when application is shutting down:
worker.shutdown(timeout: 10)
```