## 🚀 Non-Blocking IO with select

For high-concurrency file or socket operations, using blocking reads can stall your entire thread. Combine `IO#read_nonblock`/`write_nonblock` with `IO.select` to build a simple reactor loop without external gems.

```ruby
readers = [io1, io2]  # array of IO objects
loop do
  ready_to_read, = IO.select(readers, nil, nil, 0.5)
  next unless ready_to_read

  ready_to_read.each do |io|
    begin
      data = io.read_nonblock(4096)
      handle_data(io, data)
    rescue IO::WaitReadable
      # will retry on next select
    end
  end
end
```

This pattern scales to thousands of descriptors in a single-threaded reactor.