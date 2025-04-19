## 🔍 Pattern-Based Traversal with Pathname and Dir.glob

Combine `Pathname` with `Dir.glob` for clean, object‑oriented file discovery. This lets you apply patterns, filter results, and chain methods on `Pathname` instances for more readable directory management.

```ruby
require 'pathname'

base = Pathname.new('app/models')
# Find all Ruby files in nested directories
ruby_files = Dir.glob(base.join('**', '*.rb'))
              .map { |f| Pathname.new(f) }

ruby_files.each do |file|
  puts "Model: #{file.basename('.rb')}"
end
```

You can further filter by file size or modification time:

```ruby
large_files = ruby_files.select { |pn| pn.size > 10 * 1024 }
puts "Large model files:"
large_files.each { |pn| puts "– #{pn}" }
```