## ⚙️ Manipulating File Descriptors with fcntl

For ultimate control over IO behavior, use `Fcntl` constants to tweak descriptor flags. For instance, setting `O_SYNC` forces writes to hit the disk, and `O_NONBLOCK` toggles non-blocking mode.

```ruby
require 'fcntl'

fd = IO.sysopen('data.log', Fcntl::O_RDWR | Fcntl::O_CREAT)
io = IO.new(fd)

# Enable synchronous writes
flags = io.fcntl(Fcntl::F_GETFL, 0)
io.fcntl(Fcntl::F_SETFL, flags | Fcntl::O_SYNC)

i.write("Important log entry\n")
io.close
```

Adjusting these flags can help with real-time guarantees or integrating with event loops.