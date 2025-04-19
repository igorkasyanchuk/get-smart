## 🔒 Atomic Writes via Tempfile

To prevent readers from seeing partially-written files, write to a temporary file then atomically rename it into place. `Tempfile` plus `Dir#rename` guarantees atomicity on POSIX file systems.

```ruby
require 'tempfile'

def atomic_write(path)
  dir = File.dirname(path)
  Tempfile.create(File.basename(path), dir) do |tmp|
    tmp.binmode
    tmp.write(your_content)
    tmp.flush
    tmp.fsync
    tmp.close
    File.rename(tmp.path, path)
  end
end

atomic_write('config.json')
```

This ensures readers never observe a half-written target.