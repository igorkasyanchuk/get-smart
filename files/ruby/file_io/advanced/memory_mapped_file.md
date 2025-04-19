## 🗺 Memory-Mapped File Access

Memory mapping a file lets the OS handle paging, which can yield significant performance improvements for random reads/writes on large data sets. Use the `mmap` gem to map a file into Ruby’s address space and treat it like a `String` or `IO`.

```ruby
require 'mmap'

mmap = Mmap.new('large.dat', Mmap::MAP_SHARED)
# Read a slice without copying
header = mmap[0, 256]
# Modify in-place
mmap[10_000, 4] = [42].pack('L<')
mmap.sync # flush changes to disk
mmap.unmap
```

This technique is ideal for binary protocols or database-like access patterns.
