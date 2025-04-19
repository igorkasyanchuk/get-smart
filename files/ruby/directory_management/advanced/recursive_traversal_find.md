## 🔍 Efficient Recursive Directory Traversal with Find and Pathname

When you need to walk a complex directory tree, Ruby’s `Find` module paired with `Pathname` gives you both speed and expressive power. This approach helps you skip unwanted paths (like `.git`), resolve symlinks safely, and filter by file type in a single pass.

```ruby
require 'find'
require 'pathname'

root = Pathname.new('/path/to/project')
ignored_dirs = %w[.git node_modules vendor]

Find.find(root) do |path_str|
  path = Pathname.new(path_str)

  # Skip unwanted directories early
  if path.directory? && ignored_dirs.include?(path.basename.to_s)
    Find.prune
  end

  # Only process real files, not broken symlinks
  next unless path.file? && path.realpath.file?

  # Example: pick up only Ruby files
  if path.extname == '.rb'
    puts "Found Ruby file: #{path.relative_path_from(root)}"
  end
end
```  
This pattern scales to millions of files, avoids infinite loops from symlink cycles, and keeps your code readable and maintainable.