## 💡 Use Block Form for Auto Cleanup
Using Tempfile in block form ensures it’s closed and unlinked automatically when the block exits. This pattern prevents resource leaks and is perfect for short‑lived tasks without manual cleanup.

```ruby
require 'tempfile'

Tempfile.create(['demo', '.txt']) do |file|
  file.write("Block form handles cleanup!\n")
  file.rewind
  puts file.read  # => "Block form handles cleanup!\n"
end

# At this point, the tempfile is closed and deleted automatically.
```