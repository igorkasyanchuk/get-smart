## 🏗️ Lazy Initialization with Double‑Checked Locking

Double‑checked locking avoids repeatedly locking a mutex once the resource is initialized. First, check if the resource is set; if not, acquire the lock and check again before initializing.

```ruby
require 'thread'

class Configuration
  @config = nil
  @mutex = Mutex.new

  def self.instance
    return @config if @config

    @mutex.synchronize do
      @config ||= load_config
    end
  end

  def self.load_config
    # expensive operation
    sleep(0.2)
    { db: 'postgresql', pool: 5 }
  end
end

threads = 5.times.map { Thread.new { p Configuration.instance } }
threads.each(&:join)
```