## 🔧 Manipulate File Descriptors Directly via FFI and `fcntl`
When you need to tweak low‑level flags (e.g., set `O_DIRECT` for bypassing page cache), use Ruby’s FFI to call `fcntl` on the file descriptor.

```ruby
require 'ffi'

module SysCtl
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  FFI::TypeDefs = { int: :int }
  attach_function :fcntl, [:int, :int, :int], :int
end

O_DIRECT = 0o40000
file = File.open('data.bin', 'r+')
fd = file.fileno
res = SysCtl.fcntl(fd, SysCtl::Fcntl::F_SETFL, O_DIRECT)
raise "fcntl failed" if res == -1

# Now reads and writes bypass the OS page cache (alignment restrictions apply)
file.read(4096)
file.close
```

This grants ultimate control over I/O semantics but requires careful attention to alignment and performance implications.