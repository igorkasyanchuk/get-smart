## 🗂 Safe Directory Creation with FileUtils

When you need to ensure a nested directory structure exists without raising errors if parts already exist, use `FileUtils.mkdir_p`. It creates all intermediate directories atomically and won’t fail if the path is already in place. This keeps your setup scripts idempotent and robust.

```ruby
require 'fileutils'

# Create a deep directory structure safely
path = File.join('tmp', 'logs', '2023', '08')
FileUtils.mkdir_p(path)
puts "Created directory: #{path}" if Dir.exist?(path)
```

You can also pass an array of paths to create multiple directories in one call:

```ruby
dirs = ['tmp/cache', 'tmp/uploads', 'tmp/exports']
FileUtils.mkdir_p(dirs)
```