## 🗃️ Using Tempfile for Safe Temporary Files
`Tempfile` creates and cleans up temporary files securely. It avoids name collisions and automatically deletes the file when it’s closed or the program exits.

```ruby
require 'tempfile'

tmp = Tempfile.new('data')
tmp.write("temporary data")
tmp.rewind
puts tmp.read

tmp.close
tmp.unlink  # deletes the file
```