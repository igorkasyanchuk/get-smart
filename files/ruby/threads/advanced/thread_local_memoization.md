## 🧵 Safe Thread-Local Memoization

Avoid cross-thread cache collisions by storing memoized results in `Thread.current`. This pattern ensures each thread lazily initializes its own data without locks.

```ruby
module ThreadLocalMemoize
  def thread_memoize(name)
    raise ArgumentError unless block_given?
    Thread.current[:memo] ||= {}
    Thread.current[:memo][name] ||= yield
  end
end

class ExpensiveLoader
  extend ThreadLocalMemoize

  def self.config
    thread_memoize(:config) do
      # Simulate heavy parsing
      sleep 0.2
      {env: ENV['APP_ENV'] || 'development'}
    end
  end
end

threads = 5.times.map do
  Thread.new { p ExpensiveLoader.config }
end
threads.each(&:join)
```