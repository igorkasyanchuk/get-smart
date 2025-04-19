## 🔒 Achieve Atomic Writes with `Tempfile`, `flock`, and `rename`
To guarantee crash‑safe, atomic file updates, write to a temporary file in the same directory, `fsync` it, `rename` it into place, and optionally `fsync` the parent directory.

```ruby
require 'tempfile'

def atomic_write(path)
  dir = File.dirname(path)
  Tempfile.open(File.basename(path), dir) do |tmp|
    tmp.binmode
    yield tmp
    tmp.fsync
    tmp.close
    File.rename(tmp.path, path)
    Dir.open(dir) { |d| d.fsync } if File.const_defined?(:FSYNC)
  end
end

atomic_write('config.yml') do |f|
  f.write new_yaml_content
end
```

This pattern ensures that at no point does the target file appear in a partially‑written state, critical for configuration or financial data.