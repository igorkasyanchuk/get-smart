## 🚀 Leverage `sendfile` for Kernel‑Level Data Transfer
Use Ruby’s `IO#sendfile` (available on recent MRI versions) to offload file copying to the OS kernel—eliminating userland byte copies. Ideal for proxying large static assets in web servers or CDN implementations.

```ruby
# Source and destination file descriptors
src = File.open('video.mp4', 'rb')
dst = File.open('output.dat', 'wb')

# Send 0..EOF, using fallback if unsupported
bytes_sent = dst.sendfile(src, 0, src.size)
puts "Sent #{bytes_sent} bytes via zero-copy"

src.close
dst.close
```

When supported by your OS (Linux, macOS), this system call drastically reduces CPU usage and memory bandwidth for large-file copies.