## ⚙️ Implement Nonblocking Reads with `read_nonblock` and `select`
For event-driven applications (network proxies, high-speed processors), combine `IO#read_nonblock` with `IO.select` to avoid blocking the reactor thread on disk reads.

```ruby
file = File.open('stream.log', 'r')
file.sync = true

loop do
  ready = IO.select([file], nil, nil, 0.1)
  if ready
    begin
      chunk = file.read_nonblock(4096)
      process(chunk)
    rescue IO::WaitReadable
      next
    rescue EOFError
      break
    end
  end
end
```

This pattern ensures your event loop remains responsive even under heavy disk I/O pressure.