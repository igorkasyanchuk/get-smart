## 📝 Create and Write to a Tempfile
Tempfile objects let you create temporary files without worrying about naming conflicts or cleanup. They’re ideal for short‑lived data like uploaded images or intermediate results. Simply require the library, instantiate a Tempfile, write your data, and rewind if you need to read it back.

```ruby
require 'tempfile'

# Create a new Tempfile (auto-deletes on garbage collection)
tmp = Tempfile.new('my_tempfile')
# Write some data to it
tmp.write("Hello, Tempfile!\n")
# Rewind the pointer so you can read from the start
tmp.rewind
# Read what you just wrote
puts tmp.read  # => "Hello, Tempfile!\n"

# Close and unlink when done (optional, auto on exit)
tmp.close
tmp.unlink
```