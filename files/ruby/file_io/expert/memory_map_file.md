## 🧠 Use Memory-Mapped Files for Zero-Copy Access
Memory‑mapping a file lets you treat file contents as if they were in-memory arrays, avoiding extra buffer copies and leveraging the OS page cache. For large datasets or performance‑critical workloads (e.g., binary parsing, image processing), use the `mmap` gem for direct and efficient access.

```ruby
require 'mmap'

# Memory-map a 1GB file read-only
mm = Mmap.new('large_data.bin', Mmap::MAP_SHARED, Mmap::PROT_READ)

# Access bytes directly
puts mm[0, 16].unpack('H*')

# Modify in place if writable
# mm.protect = Mmap::PROT_READ | Mmap::PROT_WRITE
# mm[0] = 0xFF

mm.unmap
```

This approach bypasses Ruby’s IO buffers and uses the OS’s virtual memory mechanisms, providing near-native performance when iterating or slicing huge files.