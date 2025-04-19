## 🏗️ Creating Directories Recursively with FileUtils

When you need to build nested folder structures, `FileUtils.mkdir_p` is your go‑to. It creates all missing directories along the given path in one call and does nothing if they already exist—no need to check manually.

```ruby
require 'fileutils'

# Create a deep nested path in one step
FileUtils.mkdir_p("./tmp/logs/2024/january")
puts "Directory structure created!"
```

```ruby
# You can also set permissions when creating directories
FileUtils.mkdir_p("./tmp/data", mode: 0o755)
puts "Created './tmp/data' with permissions 755"
```