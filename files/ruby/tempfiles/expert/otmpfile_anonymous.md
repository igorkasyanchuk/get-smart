## 🚀 Anonymous Tempfiles with O_TMPFILE
Bypass on-disk leaks by creating truly anonymous temporary files using the Linux-specific `O_TMPFILE` flag. This method never emits a visible pathname, so there's no need for manual cleanup—the kernel discards the file when you close its descriptor. You can treat the returned `IO` handle just like a regular file for reads and writes.

```ruby
require 'fileutils'
require 'tempfile'

# Set flags for an anonymous temp file (Linux-only)
flags = File::Constants::O_TMPFILE | File::Constants::O_RDWR
dir   = Dir.tmpdir

# Open an unlinked temp file descriptor
anon_fd  = File.open(dir, flags, 0o600)
anon_io  = IO.new(anon_fd.fileno, 'r+')

# Use it as normal
anon_io.write "Sensitive data"
anon_io.rewind
puts anon_io.read  # => "Sensitive data"

# Closing auto-discards without touching disk
anon_io.close
```